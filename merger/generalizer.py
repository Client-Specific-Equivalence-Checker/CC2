import shlex, subprocess
import re

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
                clean =  parition_effects[k].strip("Effect: ")
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