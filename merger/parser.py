import argparse
from os import path
from pycparser import parse_file, c_generator, c_ast, c_parser
from merger import cex_parser, generalizer, client_context_encapsulator, seahorn_cex_parser, klee_cex_parser, eq_oracle_interface
import copy
import re
import sys
import time
sys.setrecursionlimit(3000)
from multiprocessing.dummy import Pool as ThreadPool
from multiprocessing import cpu_count
from threading import Lock

early_stop = False
impacted = False
old_touched = set()
new_touched = set()
touched = set()
renamed = set()
declared = set()
value_copied =set()
Return_bindings = {}
r_max_depth = 3000
SEAHORN = "SEAHORN"
KLEE = "KLEE"

def str_to_boolean(input):
    return input is not None and  input.lower() in ["yes", "true", "y", "ok"]


class Timer(object):
    def __init__(self):
        self.interval_time = 0.0
        self.start_timer = 0.0

    def start(self):
        self.start_timer = time.time()

    def end(self):
        self.interval_time += time.time() - self.start_timer
        self.start_timer = 0.0

    def get_time(self):
        return self.interval_time

def replace_bit_vector(input):
            return input.replace("bvsrem", "%").replace("bvslt", "<").replace("bvult","<").\
                replace("bvsle", "<=").replace("bvule","<=").replace("bvsgt", ">").replace("bvugt", ">").replace("bvsge", ">=").replace("bvuge",">=")


def constant_zero():
    return c_ast.Constant(value='0', type='int')

def clear_global():
    global impacted
    global  old_touched
    global  new_touched
    global  touched
    global  renamed
    global  declared
    global  value_copied
    impacted = False
    old_touched = set()
    new_touched = set()
    touched = set()
    renamed = set()
    declared = set()
    value_copied = set()
    return

def get_args_from_lib_file(node):
    signature_list = []
    lib_node = node.ext[1]
    for arg in lib_node.decl.type.args.params:
        if isinstance(arg, c_ast.Decl):
            signature_list.append(arg.name)
    return signature_list


def parse_name_from_decl_list(nodes):
    signature_list =[]
    for arg in nodes:
        if isinstance(arg, c_ast.ID) or isinstance(arg, c_ast.Decl):
            signature_list.append(arg.name)
    return signature_list

def check_eq(file_name, engine, library_arg, library_name, timer, assumption_set, unwind, bmc_incremental,r_max_depth, hybrid_sovling=False,
             merged_lib = None, post_assertion_set = set(), pre_assumption_set = set()):
    global SEAHORN
    global  KLEE

    while (True):
        if (engine == SEAHORN):
            complete = True
            arg_map, arg_list = seahorn_cex_parser.launch_seahorn_cex(file_name, library_arg,
                                                                      library=library_name, timer=timer)
        elif (engine == KLEE):
            arg_map, arg_list, vpe, complete = klee_cex_parser.launch_klee_cex(file_name, library_arg,
                                                                     library=library_name, unwind=unwind,
                                                                     timer=timer, max_recusive_depth=r_max_depth)
            visited_assumption = vpe.get_visit_partition_str()
            should_refine = len(visited_assumption) > 0
            if should_refine:
                assumption_set.add(visited_assumption)
        else:
            arg_map, arg_list, complete = cex_parser.launch_CBMC_cex(file_name, library_arg, library=library_name,
                                                           unwinds=unwind,
                                                           incremental_bound_detection=bmc_incremental, timer=timer)
        if (not hybrid_sovling or complete):
            return arg_map, arg_list
        else:
            if (engine==KLEE and merged_lib is not None and should_refine):
                refine_library(merged_lib, assumption_set, post_assertion_set, pre_assumption_set)
            engine = SEAHORN
            continue





def main():
    global  r_max_depth
    global SEAHORN
    global KLEE
    global early_stop


    parser = argparse.ArgumentParser()
    parser.add_argument('--new', type=str, dest='new', default="new.c", help ="new source file" )
    parser.add_argument('--old', type=str, dest ='old', default="old.c", help="old source file")
    parser.add_argument('--client', type=str, dest ='client', default="client", help="client function name" )
    parser.add_argument('--lib', type=str, dest='lib', default="lib", help="lib function name")
    parser.add_argument('--unwind', type=int, dest='unwind', default=100, help="unwind  bound for bounded model checking")
    parser.add_argument('--engine', type=str, dest='engine', default="CBMC", help="select a verification backend engine "
                                                                                  "from CBMC, SEAHORN or KLEE")
    parser.add_argument('--EQ-ORACLE', type=str, dest='oracle', default="",
                        help="Use external equivalence checker "
                             "from REVE, KLEE or ModDiff")
    parser.add_argument('--BMC-incremental', type=str, dest='bmc_incremental', default="True",
                        help="Allow BMC to incrementally detect program bound until reaching unwind limit.")

    parser.add_argument('--hybrid-solving', type=str, dest='hybrid', default="False",
                        help="Allow dynamic verification technique adjustment")
    parser.add_argument('--concurrent', type=str, dest='concurrent', default="False", help='enable Concurrent MLC checking, default=False')

    args = parser.parse_args()
    path_old = args.old
    path_new = args.new
    use_eq_checker = len(args.oracle) == 0
    client_context_encapsulator.is_MLCCheker = use_eq_checker
    concurrent_MLC = str_to_boolean(args.concurrent)


    if path.isfile(path_old) and path.isfile(path_new):
        total_timer = Timer()
        total_timer.start()
        base_lib_file, client_seq, _, _, _, _, client_name = merge_files (path_old, path_new, args.client, args.lib)
        MSCs = []
        total_solving_time = 0.0
        #if not use_eq_checker:
        #    return eq_oracle_interface.check_equivlence
        #concurrent MLC checking
        if concurrent_MLC and len(client_seq) >1:
            #use half of the CPUs
            pool = ThreadPool(int(cpu_count()/2))
            innput_array =[]
            lock = Lock()
            makeLock = Lock()
            for i in range(len(client_seq)):
                immediate_callee = client_seq[i]
                innput_array.append([immediate_callee, base_lib_file, args, client_name, MSCs, str(i), lock, makeLock])

            results = pool.starmap_async(CheckMLCs, innput_array)
            while(not results.ready() and not early_stop):
                continue
            if early_stop:
                print ("Find counter example")
                total_timer.end()
                print("Total Checking Time: {time}".format(time=total_timer.get_time()))
                exit(0)
            else:
                results = results.get()
                for i in range(len(client_seq)):
                    eq, time = results[i]
                    total_solving_time += time
                    if not eq:
                        print("Solver decision Time: {time}".format(time=total_solving_time))
                        total_timer.end()
                        print("Total Checking Time: {time}".format(time=total_timer.get_time()))
                        exit(0)
        #seq MLC checking
        else:
            for i in range(len(client_seq)):
                immediate_callee = client_seq[i]
                eq, time = CheckMLCs(immediate_callee, base_lib_file, args, client_name, MSCs, prefix_index=str(i))
                total_solving_time += time
                if not eq:
                    print("Solver decision Time: {time}".format(time=total_solving_time))
                    total_timer.end()
                    print("Total Checking Time: {time}".format(time=total_timer.get_time()))
                    exit(0)
        print("All lib call-sites have been checked, CSE")
        if len(MSCs) == 0:
            print ("MSC is the library")
        else:
            generator = c_generator.CGenerator()
            print ("MSC is: ")
            print ("Solver decision Time: {time}".format(time=total_solving_time))
            print (generator.visit(MSCs[-1].node))
        total_timer.end()
        print("Total Checking Time: {time}".format(time=total_timer.get_time()))
        return MSCs


    else:
        print("invalid input files")
        exit(1)

def lock_actions(lock):
    if lock is not None :
        lock.acquire()

def unclock_actions(lock):
    if lock is not None :
        lock.release()

def CheckMLCs(immediate_callee, base_lib_file, args, client_name, MSCs, prefix_index ="0", lock=None, makeLock=None):
    global early_stop
    global INDEP_INPUT_TOKEN
    library_merged_file_name = "merged_{d}.c".format(d=prefix_index)
    library_merged_generalized_file_name = "merged_g_{d}".format(d=prefix_index)
    library_merged_generalized_file_name_extension = library_merged_generalized_file_name+".c"
    client_merged_file_name = "client_merged_{d}.c".format(d=prefix_index)
    client_merged_generalized_file = "client_merged_g_{d}".format(d=prefix_index)
    client_merged_generalized_file_extension = client_merged_generalized_file + ".c"
    client_merged_precond_file = "client_merged_pre_cond_g_{d}".format(d=prefix_index)
    client_merged_precond_file_extension = client_merged_precond_file + ".c"
    timer = Timer()
    assumption_set = set()
    post_assertion_set = set()
    pre_assumption_set = set()
    immediate_caller = immediate_callee.parent
    engine = args.engine
    iteration_num = 0
    bmc_incremental = str_to_boolean(args.bmc_incremental)
    hybrid_sovling = str_to_boolean(args.hybrid)
    lock_actions(lock)
    if (immediate_caller.checked) or immediate_caller.check_leaves():
        unclock_actions(lock)
        return True, timer.get_time()
    immediate_caller.verify_checked()
    unclock_actions(lock)
    if immediate_caller.arg_lib is not None:
        merged_lib = rewrite_lib_file(immediate_callee.lib_node ,outfile=library_merged_file_name)
    else:
        merged_lib = rewrite_lib_file(base_lib_file, outfile= library_merged_file_name)

    arg_map, arg_list = check_eq(library_merged_file_name, engine, get_args_from_lib_file(merged_lib), args.lib, timer,
                                 assumption_set, args.unwind, bmc_incremental, r_max_depth,
                                 hybrid_sovling=hybrid_sovling,
                                 merged_lib=merged_lib, post_assertion_set=post_assertion_set,
                                 pre_assumption_set=pre_assumption_set)

    while (len(arg_map.keys()) > 0) and not immediate_caller.check_leaves():
        write_out_generalizible_lib(merged_lib, library_merged_generalized_file_name_extension, lib_name=args.lib)
        pe = generalizer.generalize(library_merged_generalized_file_name, args.lib, arg_map[args.lib], timer=timer, lock=makeLock)
        assumption_set.add(pe.get_parition())
        restricted_c_file, old_lib_string, new_lib_string, main_func, g_klee_file, pre_cond_file, \
        inlined, num_ret, param_list, client_params = restrict_libraries(merged_lib, pe, immediate_caller.node, merged_outfile =client_merged_file_name)

        carg_map, carg_list = check_eq(restricted_c_file, engine, parse_name_from_decl_list(client_params),
                                       client_name, timer, set(), args.unwind, bmc_incremental, r_max_depth,
                                       hybrid_sovling=False)

        if (len(carg_map.keys()) > 0):
            print("Find counter example with the current caller, now grow")
            if immediate_caller.parent is None:
                print("Grow out of context, CEX")
                early_stop = True
                return  False, timer.get_time()
            else:
                merged_lib = rewrite_lib_file(immediate_caller.lib_node, outfile=library_merged_file_name)
                immediate_caller = immediate_caller.parent
                lock_actions(lock)
                if (immediate_caller.checked) or immediate_caller.check_leaves():
                    unclock_actions(lock)
                    return True, timer.get_time()
                immediate_caller.verify_checked()
                unclock_actions(lock)
                assumption_set = set()
                post_assertion_set = set()
                pre_assumption_set = set()
                # check previous CEX immediately in the new librray and client
                if immediate_caller.arg_lib is None:
                    arg_map, arg_list = carg_map, carg_list
                    arg_map[args.lib] = arg_map[args.client]
                else:
                    arg_map, arg_list = check_eq(library_merged_file_name, engine, get_args_from_lib_file(merged_lib), args.lib,
                                                 timer,
                                                 assumption_set, args.unwind, bmc_incremental, r_max_depth,
                                                 hybrid_sovling=hybrid_sovling,
                                                 merged_lib=merged_lib, post_assertion_set=post_assertion_set,
                                                 pre_assumption_set=pre_assumption_set)



        else:
            print("Iteration %d UNSAT" % iteration_num)
            if g_klee_file is not None:
                write_out_generalizible_client(g_klee_file, client_merged_generalized_file_extension, False, lib_name=args.lib)
                cpe = generalizer.generalize_client(client_merged_generalized_file, args.client, inlined, num_ret, lib_name=args.lib,
                                                    timer=timer, lock=makeLock)
                if (len(post_assertion_set) == 0):
                    post_assertion_set.update(cpe.get_base_assumption())
                post_assertion_set.update(cpe.get_post_assertion_list())
            if pre_cond_file is not None and len(pre_assumption_set) == 0:
                write_out_generalizible_client(pre_cond_file, client_merged_precond_file_extension, True, lib_name=args.lib)
                ppe = generalizer.generalize_pre_client(client_merged_precond_file, args.client, inlined, num_ret,
                                                        param_list, lib_name=args.lib, timer=timer, lock=makeLock)
                pre_assumption_set.update(ppe.get_preconditions())
            refine_library(merged_lib, assumption_set, post_assertion_set, pre_assumption_set, outfile=library_merged_file_name)

            arg_map, arg_list = check_eq(library_merged_file_name, engine, get_args_from_lib_file(merged_lib), args.lib,
                                         timer, assumption_set, args.unwind, bmc_incremental, r_max_depth,
                                         hybrid_sovling=hybrid_sovling,
                                         merged_lib=merged_lib, post_assertion_set=post_assertion_set,
                                         pre_assumption_set=pre_assumption_set)

    # We have proved CSE for a lib call-site, mark all verified callers and move on
    lock_actions(lock)
    immediate_caller.verify_checked()
    immediate_caller.mark_leaves()
    unclock_actions(lock)
    # add the current caller to MSC
    MSCs.append(immediate_caller)
    return True, timer.get_time()

def rewrite_lib_file(new_lib, outfile = "merged.c"):
    generator = c_generator.CGenerator()
    with open(outfile, 'w') as out:
        out.write(generator.visit(new_lib))

    return new_lib



def refine_library(m_file, assumptions, post_assertion, pre_assumptions, outfile="merged.c"):
    m_file_copy = copy.deepcopy(m_file)
    parser = c_parser.CParser()
    for assume in assumptions:
        if len(assume) == 0:
            assume = "1"
        hackie_assume = "int a = (" + replace_bit_vector(assume.replace("false", "0").replace("true", "1")) +");"
        ass_node = (parser.parse(hackie_assume).ext[0].init)
        new_expr = c_ast.If(cond=ass_node, iftrue=c_ast.Return(expr=constant_zero()), iffalse=None)
        m_file_copy.ext[1].body.block_items.insert(0, new_expr)

    if (len(post_assertion) >0):
        #remove existing assertions:
        for index in range(len(m_file_copy.ext[1].body.block_items)-1, 0, -1):
            node = m_file_copy.ext[1].body.block_items[index]
            if isinstance(node, c_ast.FuncCall):
                if (node.name.name == "assert"):
                    m_file_copy.ext[1].body.block_items.pop(index)
                    continue
            break
        if len(pre_assumptions) > 0:
            hackie_pre_assumption_string ="int a = !(" + replace_bit_vector(('|'.join(list(pre_assumptions))).replace("false", "0").replace("true", "1")) +");"
            pre_ass_node = (parser.parse(hackie_pre_assumption_string).ext[0].init)
            pre_ass_expr =  c_ast.If(cond=pre_ass_node, iftrue=c_ast.Return(expr=constant_zero()), iffalse=None)
            m_file_copy.ext[1].body.block_items.insert(0, pre_ass_expr)

        hackie_post_assertion_string = "int a = (" + replace_bit_vector(('|'.join(list(post_assertion))).replace("false", "0").replace("true", "1")) +");"
        assertion_node = (parser.parse(hackie_post_assertion_string).ext[0].init)
        m_file_copy.ext[1].body.block_items.append(c_ast.FuncCall(name=c_ast.ID(name="assert"), args=assertion_node))

    #check if there's any undefined variables
    DUV = client_context_encapsulator.DUVisitor()
    DUV.visit(m_file_copy.ext[1])
    for missing_def in DUV.missing_define:
        m_file_copy.ext[1].body.block_items.insert(0,
            c_ast.Decl(name=missing_def, quals=[], storage=[], init=None, funcspec=[],
                       bitsize=None,
                       type=c_ast.TypeDecl(declname=missing_def, quals=[],
                                           type=c_ast.IdentifierType(['int']))))


    generator = c_generator.CGenerator()
    result_string = generator.visit(m_file_copy)
    #print (result_string)
    with open(outfile, 'w') as merged_out:
        merged_out.write(result_string)
    return 0;


def restrict_libraries(lib_file, pe, client, old_lib_string=None, new_lib_string=None, main_func = None, merged_outfile ="client_merged.c" , option="CBMC"):
    global  Return_bindings
    global  r_max_depth
    klee_file = None
    pre_cond_file = None
    origin_lib = lib_file.ext[1]
    lib = copy.deepcopy(lib_file.ext[1])
    is_inlined = False
    #create base line library version
    if (old_lib_string is None or new_lib_string is None):
        lib_copy = copy.deepcopy(lib)
        lib_copy.body.block_items = []
        lib_old = lib_copy
        lib_new = copy.deepcopy(lib_copy)
        lib_old.decl.name += '_old'
        lib_old.decl.type.type.declname += "_old"
        lib_new.decl.name += '_new'
        lib_new.decl.type.type.declname += "_new"
        generator = c_generator.CGenerator()
        old_lib_string_orig = generator.visit(lib_old)
        new_lib_string_orig = generator.visit(lib_new)
        #create invo template
        param_list = []
        for lib_arg in lib_old.decl.type.args.params:
            if isinstance(lib_arg, c_ast.Decl):
                param_list.append(c_ast.ID(name=lib_arg.name))

        lib_old_invo = c_ast.FuncCall(name=c_ast.ID(name=lib_old.decl.name), args=c_ast.ExprList(exprs=param_list))
        lib_new_invo = c_ast.FuncCall(name=c_ast.ID(name=lib_new.decl.name), args=c_ast.ExprList(exprs=param_list))

    reduced_parition = pe.get_parition()
    if (len(reduced_parition) == 0 ):
        reduced_parition = "true"
    #generate assumptions and effects
    assumption_exp_new = "if(" + replace_bit_vector(reduced_parition.replace("false","0").replace("true","1").replace("ret_new =", ''))+ "){\n"
    assumption_exp_old = "if(" + replace_bit_vector(reduced_parition.replace("false","0").replace("true","1").replace("ret_old =", ''))+ "){\n"

    ret_binding = Return_bindings.get(origin_lib, None)
    num_ret = len(pe.get_effect_old().keys())
    if (ret_binding is None):
        #klee_assumption_string_new= assumption_exp_new
        for new_key, new_value in pe.get_effect_new().items():
            assumption_exp_new += "return " + replace_bit_vector(new_value.replace("true","1").replace( (new_key+" ="), '')) + ";\n"
            old_key = new_key.rstrip("_new") +"_old"
            old_value = pe.get_effect_old().get(old_key, None)
            if (old_value is not None):
                assumption_exp_old += "return " + replace_bit_vector(old_value.replace("false", "0").replace("true", "1").replace((old_key + " ="), '')) + ";\n"




        old_lib_string = old_lib_string_orig.replace("{\n", "{\n" + assumption_exp_old + "}\nreturn 99999;\n")
        new_lib_string = new_lib_string_orig.replace("{\n", "{\n" + assumption_exp_new + "}\nreturn 99999;\n")
        r_max_depth = max(len(old_lib_string), len(new_lib_string), r_max_depth)
    else:
        assumption_exp = assumption_exp_new
        recorded_var = set()
        new_else_branch = ""
        klee_init_new = ""
        old_else_branch = ""
        klee_init_old = ""
        for new_key, new_value in pe.get_effect_new().items():
            ret_name = ret_binding.get(new_key, new_key)
            if isinstance(ret_name, c_ast.ID):
                ret_name = ret_name.name
            else:
                ret_name = new_key
            assumption_exp +=  "\n" + ret_name + " = " + replace_bit_vector(new_value.replace("true", "1").replace((new_key + " ="), '')) + ";"
            new_else_branch+= "\n" + ret_name + " =  99999;"
            if ret_name not in recorded_var:
                klee_init_new+= "\npesudo_klee_make_symbolic(& {var}, sizeof(int), \" delta_{var}\");".format(var=ret_name )
                recorded_var.add(ret_name)

            old_key = new_key.rstrip("_new") +"_old"
            old_value = pe.get_effect_old().get(old_key, None)
            if old_key is not None:
                ret_name = ret_binding.get(old_key, old_key)
                if isinstance(ret_name, c_ast.ID):
                    ret_name = ret_name.name
                else:
                    ret_name = old_key
                #only process the ret value if it is an exclusive member of old lib ret
                if ret_name.endswith("_old"):
                    assumption_exp += "\n"+ret_name + " = " + replace_bit_vector(old_value.replace("false", "0").replace("true", "1").replace((old_key + " ="),
                                                                                                               '') )+ ";"
                    old_else_branch += "\n" + ret_name + " =  99999;"
                    if ret_name not in recorded_var:
                        klee_init_old += "\npesudo_klee_make_symbolic(& {var}, sizeof(int), \" delta_{var}\");".format(var=ret_name)
                        recorded_var.add(ret_name)
        assumption_exp += "\n} else \n{ " + new_else_branch + "\n" + old_else_branch +"}\n"

        if (ret_binding is None):
            old_lib_string = old_lib_string_orig.replace("{\n", "{\n" + assumption_exp_new + "}\n")
            new_lib_string = new_lib_string_orig.replace("{\n", "{\n" + assumption_exp_old + "}\n")

        old_lib_klee = "\n" + klee_init_old + "\n"
        new_lib_klee = "\n" + klee_init_new + "\n"

    #create main function for CBMC checkings
    c_file_string =""
    if (option == "CBMC" and main_func is None):
        params = client.decl.type.args

        main_function = copy.deepcopy(client)
        main_function.decl.name = "main"
        main_function.decl.type.type.declname = "main"
        main_function.decl.type.args = None
        main_function.body.block_items = []
        arg_list = []
        if params is not None:
            for item in params.params:
                main_function.body.block_items.append(copy.deepcopy(item))
                arg_list.append(c_ast.ID(name=item.name))
        main_function.body.block_items.append(c_ast.FuncCall(name=c_ast.ID(name=client.decl.name), args=c_ast.ExprList(exprs=arg_list)))

        c_file_string += ((generator.visit(main_function))+"\n")
    client_string = generator.visit(client)  +"\n";
    if (ret_binding is not None):
        #prepare string for pre-condition mining
        pre_client_string = client_string.replace("lib_old();", "int temp_old = " + generator.visit(lib_old_invo)+";").\
            replace("lib_new();",  "int temp_new = " + generator.visit(lib_new_invo)+";")

        client_string = client_string.replace("lib_old();", assumption_exp)
        klee_client_string = client_string.replace("lib_new();", old_lib_klee + new_lib_klee)
        client_string = client_string.replace("lib_new();", "")
        for funcs in lib_file.ext[2:]:
            client_string+= ("\n" +generator.visit(funcs))
            klee_client_string+= ("\n" +generator.visit(funcs))

        pre_cond_file =  merged_outfile.rstrip(".c") + "_pre_cond" +".c"
        with open(pre_cond_file, 'w') as pre_condition_file:
            pre_condition_file.write(c_file_string+ pre_client_string)

        klee_file = merged_outfile.rstrip(".c") + "_klee" +".c"
        with open(klee_file, 'w') as outfile_klee:
            outfile_klee.write(c_file_string+ klee_client_string)
        is_inlined = True
    c_file_string += client_string
    if (ret_binding is None):
        pre_cond_file = merged_outfile.rstrip(".c") + "_pre_cond" + ".c"
        with open(pre_cond_file, 'w') as pre_condition_file:
            pre_condition_file.write(c_file_string)

        klee_file = merged_outfile.rstrip(".c") + "_klee" + ".c"
        c_file_string += ((old_lib_string) + "\n")
        c_file_string += ((new_lib_string) +"\n")
        is_inlined = False
        with open(klee_file, 'w') as outfile_klee:
            outfile_klee.write(c_file_string)
    with open(merged_outfile, 'w') as outfile:
        outfile.write(c_file_string)
    return merged_outfile, old_lib_string, new_lib_string, main_function, klee_file, pre_cond_file, is_inlined, num_ret, param_list, params


def write_out_generalizible_client_imp(merged_file, filename):
    merged_client = merged_file.ext[1]
    old_nodes= []
    new_nodes= []
    for node in merged_client.body.block_items:
            if isinstance(node, c_ast.Decl):
                if re.match('CLEVER_ret_\d_old',node.name):
                    old_nodes.append(node)
                elif re.match('CLEVER_ret_\d_new',node.name):
                    new_nodes.append(node)
    for old_node in old_nodes:
        merged_client.decl.type.args.params.append(c_ast.Decl(name=old_node.name, quals=[], storage=[], init=None, funcspec=[], bitsize=None,
                                                       type=c_ast.TypeDecl(declname=old_node.name, quals=[], type=c_ast.IdentifierType(['int']))))
        merged_client.body.block_items.remove(old_node)
        merged_client.body.block_items.insert(0, c_ast.Assignment(op='=', lvalue=c_ast.ID(name=old_node.name), rvalue=constant_zero()))
    for new_node in new_nodes:
        merged_client.decl.type.args.params.append(
            c_ast.Decl(name=new_node.name, quals=[], storage=[], init=None, funcspec=[], bitsize=None,
                       type=c_ast.TypeDecl(declname=new_node.name, quals=[], type=c_ast.IdentifierType(['int']))))
        merged_client.body.block_items.remove(new_node)
        merged_client.body.block_items.insert(0, c_ast.Assignment(op='=', lvalue=c_ast.ID(name=new_node.name),
                                                                  rvalue=constant_zero()))


    generator = c_generator.CGenerator()
    merged_client.ext.pop(0)
    with open(filename, "w") as merged_g_file:
        merged_g_file.write(generator.visit(merged_client))
    return merged_client

def write_out_generalizible_client(input_file, outputfile, precondition, lib_name="lib"):
    client_file = parse_file(input_file, use_cpp=True,
                         cpp_path='gcc',
                         cpp_args=['-E', r'-Iutils/fake_libc_include'])
    return write_out_generalizible_lib(client_file, outputfile, should_copy=True, precondition_only=precondition, lib_name =lib_name)



def write_out_generalizible_lib(merged_file, filename, should_copy = True, precondition_only = False, lib_name="lib"):
    if should_copy:
        new_merged_file = copy.deepcopy(merged_file)
    else:
        new_merged_file = merged_file
    merged_lib = new_merged_file.ext[1]
    old_nodes= []
    new_nodes= []
    for node in merged_lib.body.block_items:
            if isinstance(node, c_ast.Decl):
                if re.match('CLEVER_ret_\d_old',node.name):
                    old_nodes.append(node)
                elif re.match('CLEVER_ret_\d_new',node.name):
                    new_nodes.append(node)
                elif node.init is None:
                    new_nodes.append(node)

    if merged_lib.decl.type.args is None:
        merged_lib.decl.type.args = c_ast.ParamList([])
    for old_node in old_nodes:
        merged_lib.decl.type.args.params.append(c_ast.Decl(name=old_node.name, quals=[], storage=[], init=None, funcspec=[], bitsize=None,
                                                       type=c_ast.TypeDecl(declname=old_node.name, quals=[], type=c_ast.IdentifierType(['int']))))
        merged_lib.body.block_items.remove(old_node)
        merged_lib.body.block_items.insert(0, c_ast.Assignment(op='=', lvalue=c_ast.ID(name=old_node.name),
                                                                  rvalue=constant_zero()))

    for new_node in new_nodes:
        merged_lib.decl.type.args.params.append(
            c_ast.Decl(name=new_node.name, quals=[], storage=[], init=None, funcspec=[], bitsize=None,
                       type=c_ast.TypeDecl(declname=new_node.name, quals=[], type=c_ast.IdentifierType(['int']))))
        merged_lib.body.block_items.remove(new_node)
        merged_lib.body.block_items.insert(0, c_ast.Assignment(op='=', lvalue=c_ast.ID(name=new_node.name),
                                                                  rvalue=constant_zero()))


    if precondition_only:
        LV = LastVisitor(lib_name)
        LV.visit(merged_lib)
        LV.work()


    generator = c_generator.CGenerator()
    new_merged_file.ext.pop(0)
    with open(filename, "w") as merged_g_file:
        merged_g_file.write(generator.visit(new_merged_file))
    return new_merged_file

class LastVisitor(c_ast.NodeVisitor):
    def __init__(self, lib_name):
        self.parent_child = {}
        self.tobeInsertedAfter = None
        self.old_hit = False
        self.new_hit = False
        self.lib_name = lib_name

    def generic_visit(self, node):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """
        for c in node:
            self.parent_child[c] = node
            self.visit(c)

    def visit_FuncCall(self, node):
        if not (self.old_hit and self.new_hit):
            if isinstance(node, c_ast.FuncCall):
                if (node.name.name == (self.lib_name + "_old") or node.name.name == (self.lib_name + "_new")):
                    if node.name.name == (self.lib_name + "_old"):
                        self.old_hit = True
                    if node.name.name == (self.lib_name + "_new"):
                        self.new_hit = True
                    current_node = node
                    parent = self.parent_child.get(current_node, None)
                    while parent is not None:
                        if isinstance(parent, c_ast.Compound):
                            self.tobeInsertedAfter = (parent, parent.block_items.index(current_node))
                            break
                        else:
                            current_node = parent
                            parent = self.parent_child.get(current_node, None)

    def work(self):
        if self.tobeInsertedAfter is not None:
            parent, index = self.tobeInsertedAfter
            if isinstance(parent, c_ast.Compound):
                parent.block_items.insert(index+1, c_ast.Return(expr=constant_zero()))




class FuncDefVisitor(c_ast.NodeVisitor):
    def __init__(self, target):
        self.target = target
        self.container = None

    def visit_FuncDef(self, node):
        if (self.container is None and node.decl.name == self.target):
            self.container = node
            return
'''
Version and Rename touched variables
'''
class IDRenameVisitor(c_ast.NodeVisitor):
    def __init__(self, version, targets):
        self.version = version
        self.targets = targets
        self.renamed = set()
        self.declared = set()

    def visit_ID(self, node):
        if isinstance(node, c_ast.ID):
            if not node.name.endswith("_"+self.version)and node.name in self.targets:
                self.renamed.add((node.name, self.version))
                node.name = (node.name+"_"+ self.version)

    def visit_Decl(self, node):
        if isinstance(node, c_ast.Decl):
            if not node.name.endswith("_" + self.version) and node.name in self.targets:
                self.declared.add((node.name, self.version))
                node.name = (node.name + "_" + self.version)
            if isinstance(node.type, c_ast.TypeDecl):
                if not node.type.declname.endswith("_"+self.version)and node.type.declname in self.targets:
                    self.declared.add((node.name, self.version))
                    node.type.declname = (node.type.declname+"_"+ self.version)
            if node.init is not None:
                hunter = IDhunterRaw()
                hunter.visit(node.init)
                for tnode in hunter.container:
                    if not tnode.name.endswith("_" + self.version) and tnode.name in self.targets:
                        self.renamed.add((tnode.name, self.version))
                        tnode.name = (tnode.name+"_"+ self.version)


class DeclHunter(c_ast.NodeVisitor):
    def __init__(self, target):
        self.container = {}
        self.target = target

    def visit_Decl(self, node):
        if isinstance(node, c_ast.Decl):
            if node.name in self.target:
                self.container[node.name] = copy.deepcopy(node.type)


'''
Data flow analysis on AST to determine 
touched variables.
'''

class IDhunter(c_ast.NodeVisitor):
    def __init__(self):
        self.container = set()

    def visit_ID(self, node):
        if isinstance(node, c_ast.ID):
            self.container.add(node.name)


class IDhunterRaw(c_ast.NodeVisitor):
    def __init__(self):
        self.container = []

    def visit_ID(self, node):
        if isinstance(node, c_ast.ID):
            self.container.append(node)


class DataSynVisitor(c_ast.NodeVisitor):
    def __init__(self, updateMap):
        self.update_map = updateMap

    def visit_Assignment(self, node, parent, index):
        if node.rvalue is not None and not isinstance(node.rvalue, c_ast.ID):
            self.visit(node.rvalue, node, 1)
        if node.lvalue is not None:
            if isinstance(node.lvalue, c_ast.ID):
                if node.lvalue.name in self.update_map:
                    update_targets = self.update_map[node.lvalue.name]
                    for target in update_targets:
                        node.rvalue = copy.deepcopy(node)
                        node.lvalue = c_ast.ID(name=target)
            else:
                self.visit(node.lvalue, node, 0)

    def visit_Decl(self, node, parent, index):
        if isinstance(node, c_ast.Decl) and node.name in self.update_map:
            update_targets = self.update_map[node.name]
            if node.init is not None:
                if not isinstance(node.init, c_ast.ID):
                    self.visit(node.init, node, 1)
                for target in update_targets:
                    new_init = c_ast.Assignment(op='=', lvalue=c_ast.ID(name=target), rvalue=node.init)
                    node.init = new_init

    def visit_UnaryOp(self, node, parent, index):
        if isinstance(node, c_ast.UnaryOp):
            if not (node.op.endswith("--") or node.op.endswith("++") ):
                if not isinstance(node.expr, c_ast.ID):
                    self.visit(node.expr, node, 0)
            else:
                if not isinstance(node.expr, c_ast.ID):
                    self.visit(node.expr, node, 0)
                else:
                    if node.expr.name in self.update_map:
                        update_targets = self.update_map[node.expr.name]
                        old_op = node.op;
                        for target in update_targets:
                            if (old_op.startswith('p')):
                                node = c_ast.UnaryOp(expr = c_ast.Assignment(lvalue=c_ast.ID(name = target) , rvalue=node, op='='), op=old_op)
                            else:
                                node =c_ast.Assignment(lvalue=c_ast.ID(name=target), rvalue=node, op='=')
                        if isinstance(parent, c_ast.Compound):
                            parent.block_items[index] = node
                        elif isinstance(parent, c_ast.If):
                            if (index == 1):
                                parent.iftrue = node
                            elif (index == 2):
                                parent.iffalse = node
                        elif isinstance(parent, c_ast.For):
                            parent.stmt = node
                        elif isinstance(parent, c_ast.While):
                            parent.stmt = node
                        elif isinstance(parent, c_ast.Decl):
                            if index == 1:
                                parent.init = node
                        elif isinstance(parent, c_ast.Assignment):
                            if index ==0:
                                parent.lvalue = node
                            elif index ==1:
                                parent.rvalue = node
                        elif isinstance(parent, c_ast.BinaryOp):
                            if index == 0:
                                parent.left = node
                            elif index ==1:
                                parent.right =node
                        elif isinstance(parent, c_ast.UnaryOp):
                            if index == 0:
                                parent.expr = node




    def visit(self, node, parent, index=0):
        """ Visit a node.
        """

        if self._method_cache is None:
            self._method_cache = {}

        visitor = self._method_cache.get(node.__class__.__name__, None)
        if visitor is None:
            method = 'visit_' + node.__class__.__name__
            visitor = getattr(self, method, self.generic_visit)
            self._method_cache[node.__class__.__name__] = visitor

        return visitor(node, parent, index)

    def generic_visit(self, node, parent, index=0):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """
        counter = 0
        for c in node:
            self.visit(c, node, counter)
            counter+=1




class DataModVisitor(c_ast.NodeVisitor):
    def __init__(self):
        self.define = set()
        self.use = set()

    def visit_Assignment(self, node):
        if isinstance(node, c_ast.Assignment):
            if node.lvalue is not None:
                if isinstance(node.lvalue, c_ast.ID):
                    self.define.add(node.lvalue.name)
                else:
                    self.visit(node.lvalue)
            if node.rvalue is not None:
                if isinstance(node.rvalue, c_ast.ID):
                    self.use.add(node.rvalue.name)
                else:
                    self.visit(node.rvalue)


    def visit_UnaryOp(self, node):
        if isinstance(node, c_ast.UnaryOp):
            if (node.op.endswith("--") or node.op.endswith("++") ):
                if isinstance(node.expr, c_ast.ID):
                    self.define.add(node.expr.name)
                    self.use.add(node.expr.name)
                else:
                    self.visit(node.expr)
            elif node.expr is not None:
                if isinstance(node.expr, c_ast.ID):
                    self.use.add(node.expr.name)
                else:
                    self.visit(node.expr)

    def visit_Decl(self, node):
        if isinstance(node, c_ast.Decl):
            self.define.add(node.name)

            if node.init is not None:
                if isinstance(node.init, c_ast.ID):
                    self.use.add(node.init.name)
                else:
                    self.visit(node.init)

    def visit_BinaryOp(self,node):
        if isinstance(node, c_ast.BinaryOp):
            if node.left is not None:
                if isinstance(node.left, c_ast.ID):
                    self.use.add(node.left)
                else:
                    self.visit(node.left)
            if node.right is not None:
                if isinstance(node.right, c_ast.ID):
                    self.use.add(node.right)
                else:
                    self.visit(node.right)


class ReturnHuntVisitor(c_ast.NodeVisitor):
    _method_cache = None

    def __init__(self, return_type, return_name, single_return = False):
        self.return_type = return_type
        self.return_name = return_name
        self.return_nums = 0
        self.single_return = single_return
        self.assignment_bindings = {}

    def visit_Return(self, node, parent, index=0):
        if (self.single_return):
            assignment = c_ast.Assignment(lvalue=c_ast.ID(self.return_name.format(0)), rvalue=node.expr,
                                          op="=")
        else:
            assignment = c_ast.Assignment(lvalue=c_ast.ID(self.return_name.format(self.return_nums)), rvalue=node.expr, op="=")
            self.assignment_bindings[self.return_name.format(self.return_nums)] = node.expr
        if isinstance(parent, c_ast.Compound):
            parent.block_items[index] = assignment
        elif isinstance(parent, c_ast.If):
            if (index == 1):
                parent.iftrue = assignment
            elif (index == 2):
                parent.iffalse = assignment
        elif isinstance(parent, c_ast.For):
            parent.stmt = assignment
        elif isinstance(parent, c_ast.While):
            parent.stmt = assignment
        self.return_nums += 1



    def visit(self, node, parent, index=0):
        """ Visit a node.
        """

        if self._method_cache is None:
            self._method_cache = {}

        visitor = self._method_cache.get(node.__class__.__name__, None)
        if visitor is None:
            method = 'visit_' + node.__class__.__name__
            visitor = getattr(self, method, self.generic_visit)
            self._method_cache[node.__class__.__name__] = visitor

        return visitor(node, parent, index)

    def generic_visit(self, node, parent, index=0):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """
        counter = 0
        for c in node:
            self.visit(c, node, counter)
            counter+=1


def list_merge(old_list, new_list, old_start, new_start, old_limit, new_limit, target):
    while (old_start < old_limit or new_start < new_limit):
        if (old_start < old_limit and new_start < new_limit):
            add_nodes(target, merge(old_list[old_start], new_list[new_start] ,well_formed=False))
            old_start += 1
            new_start += 1
        elif old_start < old_limit:
            target.append(merge(old_list[old_start], None))
            old_start += 1
        elif new_start < new_limit:
            target.append(merge(None, new_list[new_start]))
            new_start += 1

def merge_expressions(old, new):
    rename_ID(old.next, new.next, touched)
    if str(new.next) == str(old.next):
        return new.next
    if isinstance(new.next, c_ast.ExprList):
        exprs = new.next.exprs
    else:
        exprs = [new.next]

    if isinstance(old.next, c_ast.ExprList):
        exprs+= old.next.exprs
    else:
        exprs.append(old.next)

    return c_ast.ExprList(exprs)

def add_nodes (node_list, new_node):
    if isinstance(new_node, list):
        node_list+=new_node
    else:
        node_list.append(new_node)

def mark_touched_variables(old, new, ignore_id=False):
    global impacted
    global old_touched
    global new_touched
    global touched


    dv_old = DataModVisitor()
    if old is not None:
        dv_old.visit(old)
    dv_new = DataModVisitor()
    if new is not None:
        dv_new.visit(new)

    if (str(new) != str(old) or ignore_id):
        old_touched = old_touched.union(dv_old.define)
        new_touched = new_touched.union(dv_new.define)

    # now look at the use set. use set is considered if it has an intesection with define set.
    old_touched = old_touched.union(dv_old.use.intersection(new_touched))
    new_touched = new_touched.union(dv_new.use.intersection(old_touched))

    new_int = old_touched.union(new_touched)
    set_of_interest = new_int.difference(touched)
    touched = new_int
    return set_of_interest;

def rename_ID(old, new, touched_set):
    global renamed
    global declared
    if (len(touched_set) > 0):
        renamer = IDRenameVisitor("", list(touched_set))
        if (old is not None):
            renamer.version = "old"
            renamer.visit(old)
        if (new is not None):
            renamer.version = "new"
            renamer.visit(new)
        renamed = renamer.renamed.union(renamed);
        declared = renamer.declared.union(declared);

def rename_touched_ID(node, touched_set):
    if (len(touched_set) > 0):
        renamer = IDRenameVisitor("touched", list(touched_set))
        renamer.visit(node)


def merge(old, new, well_formed = True):
    global touched
    rename_ID(old, new, touched)
    #case 1, new and old are syntactically identical
    if (str(new) == str(old)):
        new_touched= mark_touched_variables(old, new)
        rename_ID(old, new, touched)
        if (str(new) == str(old)):
            return new
    #case 2, if one side is empty:
    elif old is None:
        new_touched = mark_touched_variables(None, new)
        rename_ID(old, new, touched)
        return new
    elif new is None:
        new_touched = mark_touched_variables(old, None)
        rename_ID(old, new, touched)
        return old
    #case 3, new or old are compound block
    if isinstance(new, c_ast.Compound) or isinstance(new, c_ast.Compound):
        if (new, c_ast.Compound):
            new_blocks =new.block_items
        else:
            new_blocks = [new]
        if isinstance(old, c_ast.Compound):
            old_blocks = old.block_items
        else:
            old_blocks = [old]
        merged = []

        #try to find loop block
        old_loop_node_index =[]
        new_loop_node_index= []

        for i in range(len(old_blocks)):
            block = old_blocks[i]
            if (isinstance(block, c_ast.For) or
                    isinstance(block, c_ast.While) or
                        isinstance(block, c_ast.DoWhile)):
                old_loop_node_index.append(i)

        for i in range(len(new_blocks)):
            block = new_blocks[i]
            if (isinstance(block, c_ast.For) or
                    isinstance(block, c_ast.While) or
                    isinstance(block, c_ast.DoWhile)):
                new_loop_node_index.append(i)

        cur_old_i = 0
        cur_new_i = 0
        merging_loop_index = 0
        while (merging_loop_index < min(len(new_loop_node_index), len(old_loop_node_index))):
            cur_old_loop_i = old_loop_node_index[merging_loop_index]
            cur_new_loop_i = new_loop_node_index[merging_loop_index]

            list_merge(old_blocks, new_blocks, cur_old_i, cur_new_i, cur_old_loop_i, cur_new_loop_i, merged)

            add_nodes(merged, merge(old_blocks[cur_old_loop_i], new_blocks[cur_new_loop_i], well_formed=False))
            cur_old_i = cur_old_loop_i+1
            cur_new_i = cur_new_loop_i+1
            merging_loop_index += 1

        list_merge(old_blocks, new_blocks, cur_old_i, cur_new_i, len(old_blocks), len(new_blocks), merged)

        return c_ast.Compound(merged)


    #case 4, if the two nodes disagree in types
    elif type(new) != type(old):
        touched_set = mark_touched_variables(old, new)
        if (len(touched_set) > 0):
            rename_ID(old, new, list(touched_set))
        if (well_formed):
            return c_ast.Compound([old, new])
        else:
            return [old, new]

    #case 6, merge decls
    elif isinstance(new, c_ast.DeclList) and isinstance(old, c_ast.DeclList):
        return c_ast.DeclList(decls=( list(set(new.decls + old.decls))))

    #case 5, merge for loops
    elif isinstance(new, c_ast.For) and isinstance(old, c_ast.For):
        #ltry to find a variable version fix-point
        while(True):
            initals = merge(new.init, old.init)
            mark_touched_variables(old.cond, new.cond)
            rename_ID(old.cond, new.cond, touched)
            disjunct_for_cond = c_ast.BinaryOp(left=old.cond, right=new.cond, op='||')
            old_statement = c_ast.If(cond=old.cond, iftrue=old.stmt, iffalse=None)
            new_statement = c_ast.If(cond=new.cond, iftrue=new.stmt, iffalse=None)
            touched_old_size = len(touched)
            loop_body =  c_ast.Compound([merge(old_statement, new_statement)])
            if (str(old.cond) != str(new.cond)):
                mark_touched_variables(old.next, new.next, ignore_id=True)
            merged_exp = merge_expressions(old, new)
            if (len(touched) == touched_old_size):
                break


        merged_for =  c_ast.For(init= initals, next=merged_exp, cond= disjunct_for_cond, stmt=loop_body)

        return merged_for

    #case 6, merge while loops
    elif isinstance(new, c_ast.While) and isinstance(old, c_ast.While):
        # ltry to find a variable version fix-point
        while (True):
            mark_touched_variables(old.cond, new.cond)
            rename_ID(old.cond, new.cond, touched)
            disjunct_while_cond = c_ast.BinaryOp(left=old.cond, right=new.cond, op='||')
            old_statement = c_ast.If(cond=old.cond, iftrue=old.stmt, iffalse=None)
            new_statement = c_ast.If(cond=new.cond, iftrue=new.stmt, iffalse=None)
            touched_old_size = len(touched)
            loop_body = c_ast.Compound([merge(old_statement, new_statement)])
            if (len(touched) == touched_old_size):
                break;


        merged_while =  c_ast.While(cond= disjunct_while_cond, stmt= loop_body)
        return merged_while

    #case 7 merge if conditions
    elif isinstance(new, c_ast.If) and isinstance(old, c_ast.If):
        #if with exactly same branching conditions. If prior difference has been detected,
        #conditional var will be renamed.
        if (str(new.cond) == str(old.cond)):
            return c_ast.If(cond=new.cond, iftrue= merge(old.iftrue, new.iftrue ), iffalse=merge(old.iffalse, new.iffalse))

    #cannot merge if get here, check we need to versions variables.
    touched_set = mark_touched_variables(old, new)
    if (len(touched_set) > 0):
        rename_ID(old, new, list(touched_set))
    if (well_formed):
        return c_ast.Compound([old, new])
    else:
        return [old, new]


def add_new_declares (node, signatures):
    global renamed
    global declared

    undeclared = renamed - declared
    undeclared_name = set([name for name, version in undeclared])
    declhunter = DeclHunter(undeclared_name)
    if signatures is not None:
        declhunter.visit(signatures)
    init_by_arg = copy.deepcopy(declhunter.container)
    declhunter.visit(node)
    target_map = {}
    for (name, version) in undeclared:
            new_name = name+"_"+version
            if name in target_map:
                target_map[name] += [new_name]
            else:
                target_map[name] = [new_name]
            new_type = declhunter.container[name]
            cur_type = new_type
            while (not isinstance(cur_type, c_ast.TypeDecl)):
                cur_type = cur_type.type
            cur_type.declname = new_name
            if (name in init_by_arg):
                init_value = c_ast.ID(name=name)
            else:
                init_value = None
            node.block_items.insert(0, c_ast.Decl(name=new_name, quals=[], storage=[], init=init_value, funcspec=[], bitsize=None,
                                                       type=c_ast.TypeDecl(declname=new_name, quals=[], type=new_type)));


    syn = DataSynVisitor(target_map)
    syn.visit(node, None, 0)



def analyze_client (node, lib):
    ltv = LoopTransformerVisitor(lib)
    ltv.visit(node)
    return ltv.transformed_node

def checkModStatus(node, lib, touched_set):
    IDv = IDVisitor()
    for ele in touched_set:
        if isinstance(ele, str):
            IDv.ID_set.add(ele)
        else:
            IDv.visit(ele)

    fvistor = FuncInvocVisitor(lib, IDv.ID_set)
    fvistor.visit(node)
    return fvistor.touched

def create_nondet_nodes(names):
    nondet_list = []

    for name in names:
        rvalue = c_ast.FuncCall(name=c_ast.ID(name = "nondet_int"), args=None)
        nondet_list.append(c_ast.Assignment(lvalue= c_ast.ID(name = name), op='=', rvalue=rvalue))
    return nondet_list

def create_assert_returns(names):
    return_list = []
    for name in names:
        return_list.append(c_ast.FuncCall(name = c_ast.ID(name = 'Rassert'), args= c_ast.ExprList([c_ast.ID(name = name)])))

    return return_list

def get_name_set(touched_set):
    IDv = IDVisitor()
    for ele in touched_set:
        if isinstance(ele, str):
            IDv.ID_set.add(ele)
        else:
            IDv.visit(ele)

    return IDv.ID_set

def create_assumption(expr):
    return c_ast.FuncCall(name=c_ast.ID(name='assume'), args= c_ast.ExprList(exprs= [expr]))


class LoopTransformerVisitor(c_ast.NodeVisitor):
    def __init__(self, lib):
        self.transformed_node = []
        self.lib  = lib

    def rename(self, node, modified_set):
        IDv = IDVisitor()
        for ele in modified_set:
            if isinstance(ele, str):
                IDv.ID_set.add(ele)
            else:
                IDv.visit(ele)
        rename_touched_ID(node, IDv.ID_set)


    def visit_Compound(self, node):
        if isinstance(node, c_ast.Compound):
            for i in range(0, len(node.block_items)):
                self.visit(node.block_items[i])

            fv = FuncDataDepVisitor(self.lib)
            fv.visit(node)

            self.rename(node, fv.modified)

            if (len(fv.modified) > 0):
                names = get_name_set(fv.modified)
                new_client = create_nondet_nodes(names)
                new_client += node.block_items
                new_client += create_assert_returns(names)
                new_client = c_ast.Compound(new_client)
                self.transformed_node.append(new_client)





    def visit_While(self,node):
        if isinstance(node, c_ast.While):
            # recursively ask the question on the body of the loop, and find the
            # the first place of change
            index_keeper = []
            modi_index = []
            old_index = len(self.transformed_node)
            for i in range (0, len(node.stmt.block_items)):
                self.visit(node.stmt.block_items[i])
                index_keeper.append(len(self.transformed_node))
                if (old_index < len(self.transformed_node)):
                    modi_index.append(i)
                    old_index = len(self.transformed_node)



            fv = FuncDataDepVisitor(self.lib)
            fv.visit(node.stmt)
            fv.visit(node.cond)
            cond_diff = checkModStatus(node.cond, self.lib, fv.modified)
            if (cond_diff):
               fv.modified = fv.define
            old_size = 0
            while (len(fv.modified) - old_size) > 0:
               old_size = len(fv.modified)
               fv.visit(node.stmt)
               fv.visit(node.cond)
               cond_diff = checkModStatus(node.cond, self.lib, fv.modified)
               if (cond_diff):
                   fv.modified = fv.define


            #only looking for nested change happening after the first identified body
            start = -1
            if (node.stmt in fv.start_end):
               start = fv.start_end[node.stmt][0]
               start_index = index_keeper[start]


            #if we get here, fix-point has been reached
            # rename all modified
            self.rename(node, fv.modified)

            #add client node into the list
            if (len(fv.modified) > 0):
                names = get_name_set(fv.modified)
                new_client = create_nondet_nodes(names)
                new_client.append(create_assumption(node.cond))
                new_client += node.stmt.block_items
                new_client += create_assert_returns(names)
                new_client = c_ast.Compound(new_client)
                if (start != -1):
                    self.transformed_node.insert(start_index, new_client)
                    if (start not in modi_index):
                        self.transformed_node = self.transformed_node[:start_index+1]
                else:
                    self.transformed_node.append(new_client)




    def visit_DoWhile(self,node):
        if isinstance(node, c_ast.DoWhile):
            # recursively ask the question on the body of the loop, and find the
            # the first place of change
            index_keeper = []
            modi_index = []
            old_index = len(self.transformed_node)
            for i in range(0, len(node.stmt.block_items)):
                self.visit(node.stmt.block_items[i])
                index_keeper.append(len(self.transformed_node))
                if (old_index < len(self.transformed_node)):
                    modi_index.append(i)
                    old_index = len(self.transformed_node)

            fv = FuncDataDepVisitor(self.lib)
            fv.visit(node.stmt)
            fv.visit(node.cond)
            cond_diff = checkModStatus(node.cond, self.lib, fv.modified)
            if (cond_diff):
                fv.modified = fv.define
            old_size = 0
            while (len(fv.modified) - old_size) > 0:
                old_size = len(fv.modified)
                fv.visit(node.stmt)
                fv.visit(node.cond)
                cond_diff = checkModStatus(node.cond, self.lib, fv.modified)
                if (cond_diff):
                    fv.modified = fv.define

            # only looking for nested change happening after the first identified body
            start = -1
            if (node.stmt in fv.start_end):
                start = fv.start_end[node.stmt][0]
                start_index = index_keeper[start]

            # if we get here, fix-point has been reached
            # rename all modified
            self.rename(node, fv.modified)

            # add client node into the list
            if (len(fv.modified) > 0):
                names = get_name_set(fv.modified)
                new_client = create_nondet_nodes(names)
                new_client.append(create_assumption(node.cond))
                new_client += node.stmt.block_items
                new_client += create_assert_returns(names)
                new_client = c_ast.Compound(new_client)
                if (start != -1):
                    self.transformed_node.insert(start_index, new_client)
                    if (start not in modi_index):
                        self.transformed_node = self.transformed_node[:start_index + 1]
                else:
                    self.transformed_node.append(new_client)


class IDVisitor(c_ast.NodeVisitor):
    def __init__(self):
        self.ID_set = set()


    def visit_ID(self, node):
        if isinstance(node, c_ast.ID):
            self.ID_set.add(node.name)


class FuncInvocVisitor(c_ast.NodeVisitor):
    def __init__(self, lib, touched_set =set()):
        self.lib = lib
        self.arg_set = []
        self.touched_set = touched_set
        self.touched = False

    def visit_FuncCall(self, node):
        if isinstance(node, c_ast.FuncCall):
            if node.name.name == self.lib:
                for arg in node.args.exprs:
                    self.visit(arg)
                self.arg_set.append(node.args)
                self.touched = True


    def visit_ID(self, node):
        if isinstance(node, c_ast.ID):
            if node.name in self.touched_set:
                self.touched = True


class FuncDataDepVisitor(c_ast.NodeVisitor):
    def __init__(self, lib):
        self.lib = lib
        self.arg_list = []
        self.ret_set =set()
        self.modified = set()
        self.define = set()
        self.start_end = {}
        self.cg = c_generator.CGenerator()



    def visit_Compound(self, node):
        start = -1
        end = -1
        if isinstance(node, c_ast.Compound):
            for i in range(len(node.block_items)):
                self.visit(node.block_items[i])


        if (not node in self.start_end):
            if (start != -1):
                self.start_end[node] = (start, end)
        elif (node in self.start_end):
            new_start = self.start_end[node][0]
            new_end = self.start_end[node][1]
            if start > -1 and start < new_start:
                new_start = start
            if end > new_end:
                new_end = end
            self.start_end[node] = (new_start, new_end)


    def visit_Assignment(self, node):
        is_touched = False
        if isinstance(node, c_ast.Assignment):
            if node.rvalue is not None:
                self.visit(node.rvalue)
                is_touched  = checkModStatus(node.rvalue, self.lib, self.modified)
            if node.lvalue is not None:
                self.define.add(node.lvalue)
                if is_touched:
                    self.modified.add(node.lvalue)

    def visit_Return(self, node):
        is_touched = False
        if isinstance(node, c_ast.Return):
            if node.expr is not None:
                self.visit(node.expr)
                is_touched = checkModStatus(node.expr, self.lib, self.modified)
                if is_touched:
                    self.modified.add(c_ast.ID(name="return(" +self.cg.visit(node.expr) + ")"))




    def visit_Decl(self, node):
        is_touched = False
        if isinstance(node, c_ast.Decl):
            if node.init is not None:
                self.visit(node.init)
                is_touched = checkModStatus(node.init, self.lib, self.modified)
            if node.init is not None:
                self.define.add(node.name)
                if is_touched:
                    self.modified.add(node.init)

    def visit_UnaryOp(self, node):
        if isinstance(node, c_ast.UnaryOp):
            self.visit(node.expr)
            if (node.op.endswith("--") or node.op.endswith("++")):
                self.define.add(node.expr)

def paste_header_with_body(origin, body):
     origin_copy = copy.deepcopy(origin)
     origin_copy.body = body
     return origin_copy

def merge_libs(old_lib, new_lib):
    global Return_bindings
    clear_global()
    # convert returns into assignment
    ret_v = ReturnHuntVisitor("int", "CLEVER_ret_{}_old")
    ret_v.visit(old_lib, None)
    binding = ret_v.assignment_bindings

    ret_num = ret_v.return_nums
    ret_v = ReturnHuntVisitor("int", "CLEVER_ret_{}_new")
    ret_v.visit(new_lib, None)
    binding.update(ret_v.assignment_bindings)

    for i in range(ret_num):
        old_lib.body.block_items.insert(0, c_ast.Decl(name="CLEVER_ret_{}_old".format(i), quals=[], storage=[], init=constant_zero(), funcspec=[],
                                                      bitsize=None,
                                                      type=c_ast.TypeDecl(declname="CLEVER_ret_{}_old".format(i), quals=[],
                                                                          type=c_ast.IdentifierType(['int']))))
        new_lib.body.block_items.insert(0, c_ast.Decl(name="CLEVER_ret_{}_new".format(i), quals=[], storage=[], init=constant_zero(), funcspec=[],
                                                      bitsize=None,
                                                      type=c_ast.TypeDecl(declname="CLEVER_ret_{}_new".format(i), quals=[],
                                                                          type=c_ast.IdentifierType(['int']))))
    merged_ast = merge(old_lib.body, new_lib.body)

    add_new_declares(merged_ast, new_lib.decl.type.args)
    merged_lib = paste_header_with_body(new_lib, merged_ast)
    Return_bindings[merged_lib] = binding

    return merged_lib , ret_num

def merge_files (path_old, path_new, client, lib ,lib_eq_assetion=True):
    old_ast = parse_file(path_old, use_cpp=True,
            cpp_path='gcc',
            cpp_args=['-E', r'-Iutils/fake_libc_include'])
    new_ast = parse_file(path_new,use_cpp=True,
            cpp_path='gcc',
            cpp_args=['-E', r'-Iutils/fake_libc_include'])
    #now look for lib from both versions

    #generator = c_generator.CGenerator()
    #print(generator.visit(old_ast))

    old_lib_visitor = FuncDefVisitor(lib)
    old_lib_visitor.visit(old_ast)
    old_lib_node = old_lib_visitor.container
    old_lib_copy = copy.deepcopy(old_lib_node)
    assert not old_lib_node is None, "old lib does not exist"


    new_lib_visitor =  FuncDefVisitor(lib)
    new_lib_visitor.visit(new_ast)
    new_lib_node = new_lib_visitor.container
    new_lib_copy = copy.deepcopy(new_lib_node)
    assert not new_lib_node is None, "new lib does not exist"


    #check both lib have the same signature
    assert str(new_lib_node.decl.type) == str(old_lib_node.decl.type) , "lib functions signature mismatch"

    #convert returns into assignment
    r_types = get_type(old_lib_node)
    r_type = r_types[0]
    ret_v = ReturnHuntVisitor(r_type, "CLEVER_ret_{}_old", single_return=True)
    ret_v.visit(old_lib_node, None)
    old_lib_node.body.block_items.insert(0, c_ast.Decl(name="CLEVER_ret_0_old", quals=[], storage=[], init=constant_zero(), funcspec=[], bitsize=None,
                                                       type=c_ast.TypeDecl(declname="CLEVER_ret_0_old", quals=[], type=c_ast.IdentifierType(r_types))))
    r_types = get_type(new_lib_node)
    r_type = r_types[0]
    ret_v = ReturnHuntVisitor(r_type, "CLEVER_ret_{}_new", single_return=True)
    ret_v.visit(new_lib_node, None)
    new_lib_node.body.block_items.insert(0, c_ast.Decl(name="CLEVER_ret_0_new", quals=[], storage=[], init=constant_zero(), funcspec=[], bitsize=None,
                                                       type=c_ast.TypeDecl(declname="CLEVER_ret_0_new", quals=[], type=c_ast.IdentifierType(r_types))))

    merged_ast = merge(old_lib_node.body, new_lib_node.body)

    add_new_declares(merged_ast, new_lib_node.decl.type.args)
    merged_lib = paste_header_with_body(new_lib_node, merged_ast)

    generator = c_generator.CGenerator()

    if (lib_eq_assetion):
        merged_ast.block_items.append(c_ast.FuncCall(name = c_ast.ID(name = 'assert'), args= c_ast.BinaryOp(op='==',left= c_ast.ID(name="CLEVER_ret_0_old"),
                                                                                                            right=c_ast.ID(name="CLEVER_ret_0_new") )))
        params = merged_lib.decl.type.args

        main_function = copy.deepcopy(merged_lib)
        main_function.decl.name ="main"
        main_function.decl.type.type.declname = "main"
        main_function.decl.type.args = None
        main_function.body.block_items=[]
        arg_list = []
        for item in params.params:
            main_function.body.block_items.append(copy.deepcopy(item))
            arg_list.append(c_ast.ID(name = item.name))
        main_function.body.block_items.append(c_ast.FuncCall(name=c_ast.ID(name =lib), args=c_ast.ExprList(exprs = arg_list)))
        m_file = c_ast.FileAST(ext=[main_function, merged_lib])

    #print(generator.visit(merged_lib))

    client_visitor = FuncDefVisitor(client)
    client_visitor.visit(old_ast)
    client_node = client_visitor.container
    client_node_copy = copy.deepcopy(client_node)
    assert not client_node is None, "client does not exist"

    if (client_node.decl.name == "main"):
        client_name = "CLEVER_client"
        client_node.decl.name = "CLEVER_client"
        client_node.decl.type.type.declname = "CLEVER_client"
    else:
        client_name = client

    changed_clients = client_context_encapsulator.analyze_client(client_node, lib);

    client_index = 0;
    for i in range ( len(changed_clients)):
        node_object = changed_clients[i]
        while (node_object is not None and not node_object.processed):
            node_object.processed = True
            print("client " + str(client_index + 1))
            print(generator.visit(node_object.node))
            if (node_object is not None and node_object.node != node_object.lib_node):
                node_object.lib_node = version_merge_lib(node_object.lib_node, lib, old_lib_copy, new_lib_copy)
                #print(generator.visit(node_object.lib_node))
            #print ()
            node_object = node_object.parent
            client_index+=1


    # new we want to compute the merged client's
    merged_client = version_merge_client(client_node_copy, lib)
    #print(generator.visit(merged_client))
    return m_file, changed_clients, merged_client, old_lib_copy, new_lib_copy, m_file, client_name

def version_merge_lib(lib_node, lib, og_lib_old, og_lib_new):
    lib_old = copy.deepcopy(og_lib_old)
    lib_new = copy.deepcopy(og_lib_new)
    lib_old.decl.name += '_old'
    lib_old.decl.type.type.declname += "_old"
    lib_new.decl.name += '_new'
    lib_new.decl.type.type.declname += "_new"

    new_lib = copy.deepcopy(lib_node)
    old_lib = copy.deepcopy(lib_node)
    renamer = lib_invoc_renamer(lib, "new")
    renamer.visit(new_lib)
    renamer.version = "old"
    renamer.visit(old_lib)
    merged_lib, return_num = merge_libs(old_lib, new_lib)
    merged_lib.decl.name = lib
    function_rename(merged_lib, lib)
    for i in range(return_num):
        merged_lib.body.block_items.append(
            c_ast.FuncCall(name=c_ast.ID(name='assert'), args=c_ast.BinaryOp(op='==', left=c_ast.ID(name="CLEVER_ret_{}_old".format(i)),
                                                                             right=c_ast.ID(name="CLEVER_ret_{}_new".format(i)))))

    params = merged_lib.decl.type.args

    main_function = copy.deepcopy(merged_lib)
    main_function.decl.name = "main"
    function_rename(main_function, "main")
    main_function.decl.type.args = c_ast.ParamList([])
    main_function.body.block_items = []
    arg_list = []
    if (params is not None):
        for item in params.params:
            main_function.body.block_items.append(copy.deepcopy(item))
            arg_list.append(c_ast.ID(name=item.name))
    main_function.body.block_items.append(c_ast.FuncCall(name=c_ast.ID(name= merged_lib.decl.name), args=c_ast.ExprList(exprs=arg_list)))
    m_file = c_ast.FileAST(ext=[main_function, merged_lib, lib_old, lib_new])

    return m_file


def version_merge_client(client, lib):
    new_client = client
    old_client = copy.deepcopy(client)

    renamer = lib_invoc_renamer(lib, "new")
    renamer.visit(new_client)
    renamer.version = "old"
    renamer.visit(old_client)
    merged_client, return_num = merge_libs(old_client, new_client)
    for i in range(return_num):
        merged_client.body.block_items.append(
            c_ast.FuncCall(name=c_ast.ID(name='assert'), args=c_ast.BinaryOp(op='==', left=c_ast.ID(name="CLEVER_ret_{}_old".format(i)),
                                                                             right=c_ast.ID(name="CLEVER_ret_{}_new".format(i)))))
    return merged_client



class lib_invoc_renamer(c_ast.NodeVisitor):
    def __init__(self, lib, version):
        self.lib = lib
        self.version = version

    def visit_FuncCall(self, node):
        if isinstance(node, c_ast.FuncCall):
            if isinstance(node.name, c_ast.ID):
                if node.name.name == self.lib:
                    node.name.name += ('_'+self.version)

def function_rename(function_node, name):
    if isinstance(function_node, c_ast.FuncDef):
        renamed_type = function_node.decl.type
        while not isinstance(renamed_type, c_ast.TypeDecl):
            renamed_type = renamed_type.type
        renamed_type.declname = name

def get_type(function_node):
    if isinstance(function_node, c_ast.FuncDef):
        fun_type = function_node.decl.type
        while not isinstance(fun_type, c_ast.IdentifierType):
            fun_type = fun_type.type
        return copy.deepcopy(fun_type.names)

    raise  Exception


if __name__ == "__main__":
    main()

