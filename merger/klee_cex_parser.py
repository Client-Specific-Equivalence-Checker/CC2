import sys
import argparse
import shlex, subprocess
import re
from pycparser import c_ast, parse_file, c_generator

def prepend_file(filename, prepend_text):
    with open(filename, 'r') as file:
        content = prepend_text + file.read()
    outfile = filename.rstrip(".c") + "_sea.c"
    with open(outfile, 'w') as of:
        of.write(content)
    return outfile

def make_klee_symbolic(variable_name, trackingName):
    arg1 = c_ast.UnaryOp(op='&', expr=c_ast.ID(variable_name))
    arg2 = c_ast.UnaryOp(op='sizeof', expr = c_ast.Typename(name=None, quals =[],
                                                            type= c_ast.TypeDecl(declname=None,quals=[],
                                                                                 type=c_ast.IdentifierType(names=['int']))))
    arg3 = c_ast.Constant(type='string', value='\"'+ trackingName +'\"')
    return c_ast.FuncCall(name=c_ast.ID(name = "klee_make_symbolic"), args=c_ast.ExprList(exprs=[arg1,arg2,arg3]))


def twos_comp(val, bits):
    """compute the 2's complement of int value val"""
    if (val & (1 << (bits - 1))) != 0:  # if sign bit is set e.g., 8bit: 128-255
        val = val - (1 << bits)  # compute negative value
    return val


def launch_klee_cex(sourcefile, lib_args, library="lib", timer=None, max_recusive_depth=256):
    if sourcefile:
        source_file_node = parse_file(sourcefile, use_cpp=True,
                                 cpp_path='gcc',
                                 cpp_args=['-E', r'-Iutils/fake_libc_include'])

        for func in source_file_node.ext:
            if isinstance(func, c_ast.FuncDef) and func.decl.name == library:
                lib_file = func
                break

        if isinstance(lib_file, c_ast.FuncDef):

            calling_list = []
            to_be_inserted = []
            arg_list = []
            for decl in lib_file.decl.type.args.params:
                calling_list.append(c_ast.ID(name=decl.name))
                arg_list.append(decl)
                arg_list.append(make_klee_symbolic(decl.name, decl.name))

            lib_file.decl.type.args.params = []
            assertion_exp = []
            to_be_removed = []

            for child in lib_file.body.block_items:
                if isinstance(child, c_ast.Decl):
                    if child.name.endswith("CLEVER_EXT"):
                        calling_list.append(c_ast.ID(name= child.name))
                        to_be_inserted.append((child, make_klee_symbolic(child.name, child.name)))
                        continue

                elif isinstance(child, c_ast.FuncCall):
                    if isinstance(child.name, c_ast.ID) and child.name.name == "assert":
                        if (isinstance(child.args, c_ast.BinaryOp) and child.args.op == '==') :
                            assertion_exp.append(child.args)
                            to_be_removed.append(child)
                        elif (isinstance(child.args, c_ast.ExprList) and len(child.args.exprs) == 1 and
                             isinstance(child.args.exprs[0], c_ast.BinaryOp) and child.args.exprs[0].op == "=="):
                            assertion_exp.append(child.args.exprs[0])
                            to_be_removed.append(child)

            for r_node in to_be_removed:
                lib_file.body.block_items.remove(r_node)

            lib_file.body.block_items = (arg_list + lib_file.body.block_items)

            for key, value in to_be_inserted:
                lib_file.body.block_items.insert(lib_file.body.block_items.index(key)+1, value)

            format_string = ""
            ID_list = []
            for arg in calling_list:
                arg_name = arg.name
                format_string += "{name}=%d,".format(name=arg_name)
                ID_list.append(c_ast.FuncCall(name=c_ast.ID(name="klee_get_valued"),
                                              args=c_ast.ExprList(exprs=[c_ast.ID(name=arg_name)])))
            format_string = format_string.rstrip(",")

            if len(assertion_exp) > 0:
                head_exp = assertion_exp[0]
                for i in range(1, len(assertion_exp)):
                    head_exp = c_ast.BinaryOp(op='&',left=head_exp, right=assertion_exp[i])

            final_exp = c_ast.ExprList(exprs=[c_ast.UnaryOp(op='!', expr= head_exp)])
            lib_file.body.block_items.append(c_ast.FuncCall(name=c_ast.ID(name="klee_assume"),
                                                            args=final_exp))

            lib_file.body.block_items.append(c_ast.FuncCall(name=c_ast.ID(name="printf"),
                                                             args=c_ast.ExprList(exprs=([c_ast.Constant(type='string',
                                                                                                        value="\"CEX " + format_string + "\\n" + "\"")] + ID_list))))
            lib_file.body.block_items.append(c_ast.FuncCall(name=c_ast.ID(name="perror"),
                                                            args=c_ast.ExprList(exprs=([c_ast.Constant(type='string',
                                                                                                       value="\"A lovely CEX\"")]))))
            lib_file.body.block_items.append(c_ast.FuncCall(name=c_ast.ID(name="abort"),
                                                             args=c_ast.ExprList(exprs=[])))

            generator = c_generator.CGenerator()

            output_string =  generator.visit(source_file_node)
            output_file_name = "klee_" + sourcefile
            with open(output_file_name, "w") as o:
                o.write(output_string)

            args = shlex.split("clang-6.0 -emit-llvm -fbracket-depth=%d -c %s" % (max_recusive_depth, output_file_name))
            subprocess.call(args)
            args = shlex.split(
                "klee  -optimize  -write-no-tests -exit-on-error-type=Abort -entry-point=%s %s" % (library, output_file_name.rstrip('c') + "bc"))
            timer.start()
            result = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
            timer.end()
            output = result.stdout
            pe_info = result.stderr
            pe = PEVisitedPair(pe_info, lib_args)
            cex_lines = None
            outlines = output.split('\n')
            for line in outlines:
                if line.startswith("CEX "):
                    cex_lines = line

            if cex_lines is None:
                return {}, [], pe
            else:
                print (cex_lines)
                cex_lines = cex_lines.strip("CEX ")
                all_argmap = {}
                argmap = {}
                all_argmap[library] = argmap
                cex_args  = cex_lines.split(',')
                for cex_arg in cex_args:
                    cex_arg_tuple = cex_arg.split('=')
                    key, value = cex_arg_tuple[0], cex_arg_tuple[1]
                    if key in lib_args:
                        argmap[key] = value

                return all_argmap, lib_args, pe

            raise Exception



class PEVisitedPair(object):
    def __init__(self, pe_result, arg_lists):
        self.visited_path_constraints = set()
        pe_set = pe_result.split("Partition:")
        for pe in pe_set:
            if len(pe) > 0:
                pe_list = pe.split('\n')
                partitions = pe_list[0].split('&')
                pre_parition = []
                for part in partitions:
                    if  part != ' )  ':
                        pre_parition.append(part)

                self.visited_path_constraints.add("( " + ' & '.join(pre_parition) + " )")
                if pe_list[-1].startswith("A lovely CEX") or pe_list[-2].startswith("A lovely CEX"):
                    break;

    def get_visited_partition(self):
        return self.visited_path_constraints

    def get_visit_partition_str(self):
        return ' | '.join(self.get_visited_partition())








