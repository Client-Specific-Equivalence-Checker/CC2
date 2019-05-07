import shlex, subprocess
import re
from pycparser import parse_file, c_generator, c_ast, c_parser

template_string = 'CILLY=cilly\nCLANG=clang-6.0\nKLEE=klee\nCOPTS=-Wno-attributes\nINSTKLEE=/home/fengnick/CLEVER+/klee/_build/instKlee.cma\n# if instKlee has been installed, you can also use:\n# INSTKLEE=instKlee\n\nexport CIL_FEATURES=cil.oneret\n\n.PHONY: all clean\n\n{SOURCENAME}:{SOURCENAME}.c\n\t$(CILLY) $(COPTS) --save-temps --noPrintLn -c --load=$(INSTKLEE) --doinstKlee --entry={LIBNAME}  {ASSUMPTIONS} {SOURCENAME}.c\n\nclean:\n\trm -rf *.o *.i *.cil.* klee-*\n'

def generalize(source, libname, cex_args):
    assumption_list = []
    for arg, cex in cex_args.items():
        assumption_list.append(' == '.join([arg, repr(cex)]))
    assumptions = ' & '.join(assumption_list)
    if len(assumptions) >0:
        assumptions="--assume='{ass}'".format(ass=assumptions)
    makeString = template_string.format(SOURCENAME = source, ASSUMPTIONS=assumptions, LIBNAME=libname)
    with open("Makefile", 'w') as makeFile:
        makeFile.write(makeString)

    subprocess.call("make")
    args = shlex.split("clang-6.0 -emit-llvm -c %s.cil.c" %source )
    subprocess.call(args)
    args = shlex.split("klee -single-path=true -entry-point=%s %s.cil.bc" % (libname, source))
    result = subprocess.run(args,stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
    output = result.stderr
    new_pe = PEpair(output)
    print(new_pe.get_parition())
    print(new_pe.get_effect_new())
    print(new_pe.get_effect_old())
    return new_pe

def generalize_client(source, clientname, is_inlined = True, num_ret=1):
    makeString = template_string.format(SOURCENAME=source, ASSUMPTIONS='', LIBNAME=clientname)
    with open("Makefile", 'w') as makeFile:
        makeFile.write(makeString)

    subprocess.call("make")
    if is_inlined:
        with open(source+".cil.c", 'r') as cil_file:
            cil_file_content = cil_file.read()
            cil_file_content = cil_file_content.replace("pesudo_klee_make_symbolic", "garbage",1)
            cil_file_content = cil_file_content.replace("pesudo_klee_make_symbolic", "klee_make_symbolic").replace(" assert(", " //assert(")

        with open(source+".cil.c", 'w') as cil_file:
            cil_file.write(cil_file_content)
    else:
        cil_file_name = source+".cil.c"
        client_file = parse_file(cil_file_name, use_cpp=True,
                                 cpp_path='gcc',
                                 cpp_args=['-E', r'-Iutils/fake_libc_include'])
        LIV = LibInvocVisitor()
        LIV.visit(client_file)
        LIV.work()
        generator = c_generator.CGenerator()
        with open(source+".cil.c", 'w') as cil_file:
            cil_file.write(generator.visit(client_file).replace(" assert(", " //assert(").replace(" //assert(", " assert(", 1))

    args = shlex.split("clang-6.0 -emit-llvm -c %s.cil.c" % source)
    subprocess.call(args)
    args = shlex.split("klee -entry-point=%s %s.cil.bc" % (clientname, source))
    result = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
    output = result.stderr
    new_pe = PEClientPair(output, num_ret, is_inlined)
    print(new_pe.get_client_specific_assertions())
    return new_pe

class LibInvocVisitor(c_ast.NodeVisitor):
    def __init__(self):
        self.parent_child = {}
        self.tobeInserted=[]
        self.tobeInsertedBefore = []
        self.tobeInsertAtHead =[]

    def generic_visit(self, node):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """
        for c in node:
            self.parent_child[c] = node
            self.visit(c)

    def visit_FuncCall(self,node):
        if isinstance(node, c_ast.FuncCall):
            if (node.name.name == "lib_old" or node.name.name == "lib_new"):
                post_fix = node.name.name[4:]
                parent = self.parent_child.get(node, None)
                if parent is not None and isinstance(parent, c_ast.Assignment):
                    grandparent = self.parent_child.get(parent, None)
                    if grandparent is not None and isinstance(grandparent, c_ast.Compound):
                        self.tobeInserted.append((grandparent, parent, make_klee_symbolic(parent.lvalue.name, "delta_ret_0_"+post_fix)))
                        for i in range(len(node.args.exprs)):
                            input_variable_name = "input_{d}_".format(d=i)+post_fix
                            input_variable = c_ast.ID(name="input_{d}_".format(d=i)+post_fix)
                            self.tobeInsertedBefore.append((grandparent, parent, c_ast.Decl(name=input_variable_name, quals=[], storage=[], init=None, funcspec=[],
                       bitsize=None,
                       type=c_ast.TypeDecl(declname=input_variable_name, quals=[],
                                           type=c_ast.IdentifierType(['int'])))))
                            self.tobeInsertedBefore.append((grandparent, parent, make_klee_symbolic(input_variable_name, input_variable_name)))
                            self.tobeInsertedBefore.append((grandparent, parent, c_ast.Assignment(op='=',lvalue=input_variable, rvalue= node.args.exprs[i])))


    def work(self):
        for grandparent, parent, new_child in self.tobeInserted:
            parent_index = grandparent.block_items.index(parent)
            if parent_index>=0:
                grandparent.block_items.insert(parent_index+1, new_child)
        for grandparent, parent, new_child in self.tobeInsertedBefore:
            parent_index = grandparent.block_items.index(parent)
            if parent_index >= 0:
                grandparent.block_items.insert(parent_index, new_child)



def make_klee_symbolic(variable_name, trackingName):
    arg1 = c_ast.UnaryOp(op='&', expr=c_ast.ID(variable_name))
    arg2 = c_ast.UnaryOp(op='sizeof', expr = c_ast.Typename(name=None, quals =[],
                                                            type= c_ast.TypeDecl(declname=None,quals=[],
                                                                                 type=c_ast.IdentifierType(names=['int']))))
    arg3 = c_ast.Constant(type='string', value='\"'+ trackingName +'\"')
    return c_ast.FuncCall(name=c_ast.ID(name = "klee_make_symbolic"), args=c_ast.ExprList(exprs=[arg1,arg2,arg3]))


class PEClientPair(object):
    def __init__(self, pe_result, num_ret, is_inlined):
        self.base_assumptions = set()
        self.post_path_constraints = []
        self.pre_path_constraints = []
        self.delta_set=()
        self.is_inlined = is_inlined
        for i in range(num_ret):
            self.base_assumptions.add(("ret_{d}_old".format(d=i), "ret_{d}_new".format(d=i)))
        pe_set = pe_result.split("Partition:")
        for pe in pe_set:
            if len(pe) > 0:
                pe_list = pe.split('\n')
                partitions = pe_list[0].split('&')
                post_parition = []
                pre_parition = []
                for part in partitions:
                    if "delta_" in part:
                        post_parition.append(part.replace("delta_",""))
                        #print(part)
                    elif part != ' )  ':
                        pre_parition.append(part)

                effect_dict ={}
                reachable_result = []
                for k in range(len(pe_list)):
                    clean = pe_list[k][7:]
                    match_old = re.search(' (ret_\d_old)\s*=\s*(.*)', clean)
                    match_new = re.search(' (ret_\d_new)\s*=\s*(.*)', clean)
                    if match_old:
                        effect_dict[match_old.group(1)] = match_old.group(2).replace("delta_", "")
                    elif match_new:
                        effect_dict[match_new.group(1)] = match_new.group(2).replace("delta_", "")

                    match_input = re.search(' (input_\d)_new\s*=\s*(.*)', clean)
                    if match_input:
                        reachable_result.append(match_input.group(1) + " == " + match_input.group(2))

                processed = set()
                post_effect_eq = []
                for key, value in effect_dict.items():
                    if (key not in processed):
                        if key.endswith("_old"):
                            co_key = key.rstrip("_old") + "_new"
                        elif key.endswith("_new"):
                            co_key = key.rstrip("_new") + "_old"
                        co_value = effect_dict.get(co_key, "true")
                        if value != co_value:
                            effect_eq_constriant = (value + " == " + co_value)
                            post_effect_eq.append(effect_eq_constriant)
                            #print(effect_eq_constriant)
                            processed.add(key)
                            processed.add(co_key)
                merged_list = post_parition + post_effect_eq
                if len(merged_list) > 0:
                    self.post_path_constraints.append("(" + '&'.join(merged_list) +")" )

                if len(reachable_result) > 0:
                    reachable_result += pre_parition
                    self.pre_path_constraints.append("( " + '&'.join(reachable_result) + " )")




    def get_client_specific_assertions(self):
        return '|'.join(self.post_path_constraints)

    def get_base_assumption(self):
        result = []
        for item in self.base_assumptions:
            result.append("(" + item[0] + " == " + item[1] + ")")
        return ['&'.join(result)]

    def get_post_assertion_list(self):
        return self.post_path_constraints









class PEpair(object):
    def __init__(self, parition_effect):
        parition_effects = parition_effect.split('\n')
        self.parition = ""
        i = 0
        condition_over = False
        condition_list = set()
        while (i< len(parition_effects) and not condition_over):
            line = parition_effects[i]
            if (line.startswith('Condition:')):
                condition = line.strip('Condition:').strip()
                condition_list.add(condition)
                i+=1
            else:
                condition_over = True
        self.parition = "&".join(condition_list)
        self.new_effect = {}
        self.old_effect = {}
        for k in range(i, len(parition_effects)):
                clean =  parition_effects[k][7:]
                match_old = re.search('(ret_\d_old).*',clean)
                match_new = re.search('(ret_\d_new).*',clean)
                if match_old:
                    self.old_effect[match_old.group(1)] = clean
                elif match_new:
                    self.new_effect[match_new.group(1)]= clean

    def get_parition(self):
        return self.parition

    def get_effect_old(self):
        return self.old_effect

    def get_effect_new(self):
        return self.new_effect


if __name__ =="__main__":

    print (template_string.format(SOURCENAME = "merged", ASSUMPTIONS="a == 5", LIBNAME="lib"))

    '''
    with open("MakeTemplate", "r") as templateFile:
      templateString = templateFile.read()
      print(repr(templateString))
    '''