import shlex, subprocess
import re
from pysmt import shortcuts
import pysmt.parsing

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

def generalize_client(source, clientname):
    makeString = template_string.format(SOURCENAME=source, ASSUMPTIONS='', LIBNAME=clientname)
    with open("Makefile", 'w') as makeFile:
        makeFile.write(makeString)

    subprocess.call("make")
    with open(source+".cil.c", 'r') as cil_file:
        cil_file_content = cil_file.read()
        cil_file_content = cil_file_content.replace("pesudo_klee_make_symbolic", "garbage",1)
        cil_file_content = cil_file_content.replace("pesudo_klee_make_symbolic", "klee_make_symbolic").replace(" assert(", " //assert(")

    with open(source+".cil.c", 'w') as cil_file:
        cil_file.write(cil_file_content)
    args = shlex.split("clang-6.0 -emit-llvm -c %s.cil.c" % source)
    subprocess.call(args)
    args = shlex.split("klee -rewrite-equalities=false -entry-point=%s %s.cil.bc" % (clientname, source))
    result = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
    output = result.stderr
    new_pe = PEClientPair(output)
    print(new_pe.get_client_specific_assertions())
    return new_pe

class PEClientPair(object):
    def __init__(self, pe_result):
        self.base_assumptions = set()
        self.post_path_constraints = []
        pe_set = pe_result.split("Partition:")
        base_init = False
        for pe in pe_set:
            if len(pe) > 0:
                pe_list = pe.split('\n')
                partitions = pe_list[0].split('&')
                post_parition = []
                for part in partitions:
                    if "delta_" in part:
                        post_parition.append(part.replace("delta_",""))
                        #print(part)
                effect_dict ={}
                for k in range(len(pe_list)):
                    clean = pe_list[k][7:]
                    match_old = re.search('(ret_\d_old)\s*=\s*(.*)', clean)
                    match_new = re.search('(ret_\d_new)\s*=\s*(.*)', clean)
                    if match_old:
                        effect_dict[match_old.group(1)] = match_old.group(2).replace("delta_", "")
                    elif match_new:
                        effect_dict[match_new.group(1)] = match_new.group(2).replace("delta_", "")
                processed = set()
                post_effect_eq = []
                for key, value in effect_dict.items():
                    if (key not in processed):
                        if key.endswith("_old"):
                            co_key = key.rstrip("_old") + "_new"
                        elif key.endswith("_new"):
                            co_key = key.rstrip("_new") + "_old"
                        if not base_init:
                            if (co_key, key) not in self.base_assumptions:
                                self.base_assumptions.add((key, co_key))
                        co_value = effect_dict.get(co_key, "true")
                        if value != co_value:
                            effect_eq_constriant = (value + " == " + co_value)
                            post_effect_eq.append(effect_eq_constriant)
                            #print(effect_eq_constriant)
                            processed.add(key)
                            processed.add(co_key)
                merged_list = post_parition + post_effect_eq
                self.post_path_constraints.append("(" + '&'.join(merged_list) +")" )
                base_init = True


    def get_client_specific_assertions(self):
        return '|'.join(self.post_path_constraints)

    def get_base_assumption(self):
        result = []
        for item in self.base_assumptions:
            result.append("(" + item[0] + " == " + item[1] + ")")
        return result

    def get_post_assertion_list(self):
        return self.post_path_constraints









class PEpair(object):
    def __init__(self, parition_effect):
        parition_effects = parition_effect.split('\n')
        self.parition = ""
        i = 0
        condition_over = False
        condition_list = []
        while (i< len(parition_effects) and not condition_over):
            line = parition_effects[i]
            if (line.startswith('Condition:')):
                condition = line.strip('Condition:').strip()
                condition_list.append(condition)
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