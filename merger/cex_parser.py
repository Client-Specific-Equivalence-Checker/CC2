import sys
import argparse
import shlex, subprocess

from pysmt.smtlib.parser import SmtLibParser
from pysmt.smtlib.script import SmtLibScript
import pysmt.smtlib.commands as smtcmd


def get_cex(in_filename = "z3temp.out", out_filename = "", library="lib"):
  all_argmap = {}
  with open(in_filename, 'r+') as f:
    count = 0
    arg_list = []
    for line in f:
        if count == 0:
            res = line.rstrip()
            if res == 'unsat':
                print("Error: NO COUNTEREXAMPLES, OR ASSERTS WRONG")
                break
            elif res == 'sat':
                count = count + 1
                continue
        sanitizestr = line.rstrip().rstrip("))").lstrip("((")
        if len(sanitizestr.split()) != 2:
            #TODO: ARRAY variables should be handled here
            continue
        name = sanitizestr.split()[0].lstrip("|").rstrip("|")
        val = sanitizestr.split()[1].lstrip("\"").rstrip("\"")

        name_comp = name.split("::")
        if len(name_comp) == 2 and name_comp[1].endswith("!0@1#1"):
            funcname = name_comp[0]
            if (funcname == library):
                argname = name_comp[1].rstrip("!0@1#1")
                #print(funcname, argname, val)
                arg_list.append(argname)

                try:
                  all_argmap[funcname]
                except KeyError:
                  all_argmap[funcname] = {}
                all_argmap[funcname][argname] = val
        count = count + 1
    #import pdb; pdb.set_trace()
    for func, argmap in all_argmap.items():
        print("Function name: %s(%s)" % (func,  (',').join(arg_list)))
        print("Counterexample args:")
        for arg in arg_list:
            initval = argmap[arg]
            value = twos_comp(int('0'+initval[1:], 16), 32)
            print("\t", arg, ":", value)
            argmap[arg] = value

    return all_argmap, arg_list

def twos_comp(val, bits):
    """compute the 2's complement of int value val"""
    if (val & (1 << (bits - 1))) != 0: # if sign bit is set e.g., 8bit: 128-255
        val = val - (1 << bits)        # compute negative value
    return val

def launch_CBMC_cex(sourcefile, infile = 'tempSMTLIB.smt2' ,z3output = 'z3temp.out', unwinds=100 , outfile='result.txt', library="lib"):
    if sourcefile:
        temp_filename = sourcefile + "_SMTout.smt2"
        args = shlex.split(
            "cbmc %s --no-unwinding-assertions --unwind %d --smt2 --outfile %s" % (sourcefile, unwinds, temp_filename))
        proc = subprocess.Popen(args)
        out, err = proc.communicate(timeout=180)

        args = shlex.split("z3 %s" % (temp_filename))
        with open(z3output, "w+") as out:
            proc = subprocess.Popen(args, stdout=out)
            out, err = proc.communicate(timeout=180)
        return get_cex(z3output, outfile, library)

    elif infile:
        args = shlex.split("z3 %s > %s" % (infile))
        with open(z3output, "w+") as out:
            proc = subprocess.Popen(args, stdout=out)
            out, err = proc.communicate(timeout=180)
        return get_cex(z3output, outfile, library)
    else:
        return get_cex(library=library)

if __name__ == "__main__":
  argv = sys.argv[1:]
  
  parser = argparse.ArgumentParser()
  parser.add_argument('--sourcefile', nargs='?', default=None)
  parser.add_argument('--unwinds', type=int, default=100)
  parser.add_argument('--infile', nargs='?', default='tempSMTLIB.smt2')
  parser.add_argument('--outfile', nargs='?', default=None)
  parser.add_argument('--z3output', nargs='?', default='z3temp.out')

  io_args = parser.parse_args()
  sourcefile = io_args.sourcefile
  unwinds = io_args.unwinds
  infile = io_args.infile
  z3output = io_args.z3output
  outfile = io_args.outfile
  
  if sourcefile:
    temp_filename = sourcefile + "_SMTout.smt2"
    args = shlex.split("cbmc %s --no-unwinding-assertions --unwind %d --smt2 --outfile %s" % (sourcefile, unwinds, temp_filename))
    proc = subprocess.Popen(args)
    out, err = proc.communicate(timeout=180)

    args = shlex.split("z3 %s" % (temp_filename))
    with open(z3output, "w+") as out:
        proc = subprocess.Popen(args, stdout=out)
        out, err = proc.communicate(timeout=180)
    get_cex(z3output, outfile)

  elif infile:
    args = shlex.split("z3 %s > %s" % (infile))
    with open(z3output, "w+") as out:
        proc = subprocess.Popen(args, stdout=out)
        out, err = proc.communicate(timeout=180)
    get_cex(z3output, outfile)
  else:
    get_cex()
    #should not happen?
