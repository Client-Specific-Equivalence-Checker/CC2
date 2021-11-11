import argparse
import io
import re
import subprocess
import shlex

from pycparser import parse_file, c_generator, c_ast, c_parser
from pycparser_fake_libc import directory
from visitor import *
from checker import merge, DataSynVisitor, merge_libs
from copy import deepcopy

class CallGraph():
    def __init__(self):
        self.nodes = dict()

    def fetch_or_init(self, func_name):
        node =  self.nodes.get(func_name, None)
        if node is None:
            node = CallingNode(func_name)
            self.nodes[func_name] = node

        return node

    def fetch(self, func_name):
        return self.nodes.get(func_name, None)

    def add_call_relation(self, caller_name, callee_name):
        caller = self.fetch_or_init(caller_name)
        callee = self.fetch_or_init(callee_name)
        caller.add_callee(callee_name)
        callee.add_caller(caller_name)

class CallingNode():
    def __init__(self, func_name):
        self.func_name = func_name
        self.old_ver = None
        self.new_ver = None
        self.merged = None
        self.callee = set()
        self.caller = set()
        self.hierarchy = None
        self.verified = False
        self.result = False

    def add_caller(self, caller):
        self.caller.add(caller)

    def add_callee(self, callee):
        self.callee.add(callee)

    def __repr__(self):
        return self.func_name

def analyze_calls(func_defs, callgraph):
    for func_name, func_body in func_defs.items():
        called_funcs = find_callees(func_body)
        for callee_name in called_funcs:
            callgraph.add_call_relation(func_name, callee_name)


def slice_dependencies(callgraph, lib_name, client_name):
    explored = set()
    queue = [lib_name]
    while len(queue) > 0:
        current = queue.pop(0)
        c_node = callgraph.fetch(current)
        if current != client_name:
            for caller in c_node.caller:
                if caller not in explored:
                    queue.append(caller)
                    print("{} <- {}".format(current, caller))
        explored.add(current)

    #now a backward pass from the client
    new_explored = set()
    queue = [client_name]
    while len(queue) > 0:
        current = queue.pop(0)
        c_node = callgraph.fetch(current)
        if current != lib_name:
            for callee in c_node.callee:
                if callee in explored:
                    queue.append(callee)
        new_explored.add(current)

    #now perform slicing:
    for name, node in callgraph.nodes.items():
        new_caller = set()
        for caller in node.caller:
            if caller in new_explored:
                new_caller.add(caller)
        node.caller = new_caller
        new_callee = set()
        for callee in node.callee:
            if callee in new_explored:
                new_callee.add(callee)
        node.callee = new_callee
    return new_explored




def callAnalyzer(lib_name, client_name, file_ast, new_ast):
    #lib = find_def(file_ast,lib_name)
    #client = find_def(file_ast, client_name)
    all_func_defs = find_all_def(file_ast)
    new_lib = find_def(new_ast, lib_name)
    lib = all_func_defs.get(lib_name, None)
    assert lib is not None
    client = all_func_defs.get(client_name, None)
    assert client is not None


    callgraph = CallGraph()
    analyze_calls(all_func_defs, callgraph)
    #recursively walk up the the calling context, BFS
    filtered = slice_dependencies(callgraph, lib_name, client_name)
    create_alt_versions_versions(callgraph, all_func_defs,  filtered, new_lib, lib_name = lib_name)
    verification_res = create_task(callgraph, file_ast, lib_name, client_name)
    if verification_res:
        print("CLEVER EQ")
    else:
        print ("CLEVER NEQ")

def create_alt_versions_versions(callgraph, all_func_defs, explored, new_lib, lib_name = ""):
    vr = Verison_Renamer(explored)
    for func in explored:
        func_node = all_func_defs.get(func, None)
        assert func_node is not None

        call_node = callgraph.fetch(func)
        assert call_node is not None



        if lib_name != func:
            hn = analyze_function_hierarchy(func_node, explored)
            call_node.hierarchy = hn
            type_info = search_types(func_node)
            ret_type = get_func_type(func_node)
            merge_version_hierarchy(hn, explored, type_info, ret_type)

            vr.suffix = "_old"
            call_node.old_ver = deepcopy(func_node)
            vr.visit(call_node.old_ver)

            vr.suffix = "_new"
            call_node.new_ver = deepcopy(func_node)
            vr.visit(call_node.new_ver)

        else:
            vr.suffix = "_old"
            call_node.old_ver = deepcopy(func_node)
            vr.visit(call_node.old_ver)

            vr.suffix = "_new"
            call_node.new_ver = deepcopy(new_lib)
            vr.visit(call_node.new_ver)
        '''
        else:
            merged_lib, ret_num = merge_libs(deepcopy(func_node), new_lib)
            print(c_generator.CGenerator().visit(merged_lib))
        '''
        #merged_body = merge(deepcopy(call_node.old_ver.body), deepcopy(call_node.new_ver.body))
        #print(c_generator.CGenerator().visit(merged_body))
        #print(c_generator.CGenerator().visit(call_node.old_ver))
        #print(c_generator.CGenerator().visit(call_node.new_ver))

def merge_version_hierarchy(hn, filters, type_info, ret_type):
    assert isinstance(hn, HierachyNode)
    for c in hn.children:
        merge_version_hierarchy(c, filters, type_info, ret_type)
    merged = version_and_merge(hn.refined_node, filters, ret_type)
    add_declartions(merged, type_info, hn)
    convert_ret_into_verification(merged)
    wipe_returns(merged)
    hn.refined_node = wrap_body_with_header(merged, hn)
    print(c_generator.CGenerator().visit(hn.refined_node))

def version_and_merge(node, filters, ret_type):
    assert isinstance(node, c_ast.Compound)
    node = deepcopy(node)
    convert_return(node,ret_type)
    #convert returns into assignment
    new_node = deepcopy(node)
    old_node = deepcopy(node)

    vr = Verison_Renamer(filters, "_new")
    vr.visit(new_node)

    vr.suffix = "_old"
    vr.visit(old_node)

    merged = merge(new_node, old_node)
    return merged

def add_declartions(merged, type_info, hn):
    missing_defs, value_changed, define = find_missing_def(merged)
    def_rename = dict()
    for md in missing_defs:
        if md.endswith("_old") or md.endswith("_new"):
            original_name = md[:-4]
            if original_name in def_rename:
                def_rename[original_name] += [md]
            else:
                def_rename[original_name] = [md]

    for key, values in def_rename.items():
        if key not in define:
            new_type = get_type(key, type_info)
            for var_name in values:
                merged.block_items.insert(0, c_ast.Decl(name=var_name, quals=[], storage=[], init=c_ast.ID(name=key), align=[], funcspec=[],
                                                        bitsize=None,
                                                        type=c_ast.TypeDecl(declname=var_name, align=[], quals=[],
                                                                            type=c_ast.IdentifierType(new_type))))

    #merged.block_items = hn.new_defines + merged.block_items
    #print(c_generator.CGenerator().visit(merged))
    if len(def_rename) > 0:
        syn = DataSynVisitor(def_rename)
        syn.syncData(merged, None, 0)
    #print(c_generator.CGenerator().visit(merged))

    return merged

def convert_ret_into_verification(node):
    ret_col = hunt_returns(node)
    asserts = []
    for k, v in ret_col.items():
        if len(v) == 2:
            v = list(v)
            arg = c_ast.BinaryOp(op='==', left=v[0], right=v[1])
            asserts.append(c_ast.FuncCall(name=c_ast.ID(name="assert"), args=arg))

    if (isinstance(node, c_ast.Compound)):
        node.block_items += asserts


def verify(task, hn, sourcefile = "temp.c", timeout = 5000):
    with open(sourcefile, 'w') as file:
        file.write(c_generator.CGenerator().visit(task))



    args = shlex.split(
        "cbmc %s --unwinding-assertions --slice-formula --smt2 --stack-trace --verbosity 5 -function CLEVERTEST" % (
            sourcefile))
    proc = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    try:
        out, _ = proc.communicate(timeout=timeout)
    except subprocess.TimeoutExpired:
        print("CBMCTO")
        proc.kill()
        return False
    result = out.decode("utf-8")
    is_failed = "VERIFICATION FAILED" in result
    is_succeed = "VERIFICATION SUCCESSFUL" in result
    '''
    for line in result:
        clean = line.decode("utf-8").rstrip()
        case_match = re.search('\[(.+\.assertion\..+)\].+FAILURE', clean)
        if failed_assertion is None and case_match:
            hn.comments = out.decode("utf-8")
            return False
        else:
            case_match_success = re.search('\[(.+\.assertion\..+)\].+SUCCESS', clean)
            if case_match_success:
                is_succeed = True
    '''
    if is_succeed:
        hn.comments = "EQ"
        return True
    elif is_failed:
        hn.comments = result
        return False
    else:
        hn.comments = "Unknown"
        return False

def check_MLC( hn, file_ast):
    if hn.verified:
        return hn.result

    res = not (hn.children == [])
    for c in hn.children:
        res = res and check_MLC(c, file_ast)
        if not res:
            break

    if not res:
        # base case, now create the verification task and verify it
        file_ast.ext.append(hn.refined_node)
        # call verifier
        #print("please verifiy")
        #print(c_generator.CGenerator().visit(file_ast))
        hn.result = verify(file_ast, hn)
        hn.verified = True
        file_ast.ext.pop()
        return hn.result
    else:
        hn.result = res
        hn.verified = True
        return res




def check_eq(callgraph, calling_node, file_ast):

    if calling_node.verified:
        return calling_node.result
    else:
        escalate = calling_node.hierarchy is None
        if calling_node.hierarchy is not None:
            local_result = check_MLC(calling_node.hierarchy, file_ast)
            calling_node.verified = True
            calling_node.result = local_result
            escalate = not (local_result)
            if not local_result:
                print("{} result: {}".format(calling_node, calling_node.hierarchy.comments.replace("CLEVERTEST", str(calling_node))))
            else:
                print("{} result: EQ".format(calling_node))

        res = True
        if escalate:
            if len(calling_node.caller) == 0:
                #print("Verification failed, NEQ")
                return False
            for caller in calling_node.caller:
                caller_node = callgraph.fetch(caller)
                local_res =check_eq(callgraph, caller_node, file_ast)
                res =  res and local_res
                if not res:
                    break

        return res



def create_task(callgraph, file_ast, lib_name, client_name):
    altered = deepcopy(file_ast)
    #filter out the client
    defs = altered.ext
    for i in range(len(defs)):
        if isinstance(defs[i], c_ast.FuncDef) and defs[i].decl.name == client_name:
            altered.ext = defs[:i] + defs[i+1:]
            break


    new_def = []
    for n in callgraph.nodes:
        if n != client_name:
            node = callgraph.fetch(n)
            if node.old_ver is not None:
                new_def.append(node.old_ver)
            if node.new_ver is not None:
                new_def.append(node.new_ver)
    altered.ext += new_def

    lib_node = callgraph.fetch(lib_name)

    res = check_eq(callgraph, lib_node, altered)

    return res

def get_func_type(function_node):
    if isinstance(function_node, c_ast.FuncDef):
        fun_type = function_node.decl.type
    else:
        fun_type = function_node.type
    while not isinstance(fun_type, c_ast.IdentifierType):
        fun_type = fun_type.type
    return deepcopy(fun_type.names)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--new', type=str, dest='new', default="new.c", help="new source file")
    parser.add_argument('--old', type=str, dest='old', default="old.c", help="old source file")
    parser.add_argument('--client', type=str, dest='client', default="client", help="client function name")
    parser.add_argument('--lib', type=str, dest='lib', default="ulADD_AlignOps_us_us", help="lib function name")
    args = parser.parse_args()
    old = load(args.old)
    new = load(args.new)
    callAnalyzer(args.lib, args.client, old, new)
    #callAnalyzer("ulADD_AlignOps_us_us", "usADD_us_usp_gen", old, new)