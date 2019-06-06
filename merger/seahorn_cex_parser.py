import sys
import argparse
import shlex, subprocess
import re
from pycparser import c_ast

from pysmt.smtlib.parser import SmtLibParser
from pysmt.smtlib.script import SmtLibScript
import pysmt.smtlib.commands as smtcmd

seahorn_install = "/home/fengnick/seahorn/seahorn/build/run/bin/sea"
sea_horn_verify_header = "  extern void __VERIFIER_assume (int);\n" \
                         "  extern void __VERIFIER_error ();\n" \
                         "  __attribute__((__noreturn__)) extern void __VERIFIER_error (void);\n " \
                         "  #define assert(X) if(!(X)){__VERIFIER_error ();}\n " \
                         "  #define assume __VERIFIER_assume\n"

seahorn_cex_prefix = "@0 = private constant"
zero_init = "zeroinitializer"

def prepend_file(filename, prepend_text):
    with open(filename, 'r') as file:
        content = prepend_text + file.read()
    outfile = filename.rstrip(".c") + "_sea.c"
    with open(outfile, 'w') as of:
        of.write(content)
    return outfile

def extract_cex(cexfileName, lib_args, lib_name):
    all_argmap = {}
    all_args = []

    with open(cexfileName) as cexfile:
        cexfile_contents= cexfile.readlines()

    cex_line =""
    for line in cexfile_contents:
        if line.startswith(seahorn_cex_prefix):
            cex_line = line
            break;

    if len(cex_line) > 0:
        cexs_match = re.search('\[.*\]\s*\[(.*)\].*', cex_line)
        if cexs_match:
            cexs = cexs_match.group(1).split(',')
            if (len(cexs) >= len(lib_args)):
                argmap = {}
                all_argmap[lib_name] = argmap
                arg_num = len(lib_args)
                for i in range(arg_num):
                    argmap[lib_args[i]] = cexs[arg_num-i-1].split()[-1]
                    print ("counterexamples: %s  = %s" % (lib_args[i],cexs[arg_num-i-1].split()[-1] ) )
                all_args = lib_args
            else:
                print ("Error")
        elif cex_line.rstrip('\n').endswith(zero_init):
            argmap = {}
            all_argmap[lib_name] = argmap
            arg_num = len(lib_args)
            for i in range(arg_num):
                argmap[lib_args[i]] ='0'
                print("counterexamples: %s  = %d" % (lib_args[i], 0))
            all_args = lib_args
        else:
            print("Error")
    else:
        print ("input independent CEX")
        argmap = {}
        all_argmap[lib_name] = argmap
        for key in lib_args:
            argmap[key] = '0'

    return all_argmap, all_args


def twos_comp(val, bits):
    """compute the 2's complement of int value val"""
    if (val & (1 << (bits - 1))) != 0:  # if sign bit is set e.g., 8bit: 128-255
        val = val - (1 << bits)  # compute negative value
    return val


def launch_seahorn_cex(sourcefile, lib_args, infile='tempSMTLIB.smt2', z3output='z3temp.out', outfile='result.txt',
                    library="lib", timer=None):
    if sourcefile:
        new_file = prepend_file(sourcefile, sea_horn_verify_header)
        temp_filename = sourcefile + "_cex.ll"
        args = shlex.split(
            "%s pf %s --cex=%s" % (seahorn_install, new_file, temp_filename))
        if timer is not None:
            timer.start()
        proc = subprocess.Popen(args, stdout=subprocess.PIPE)
        result = str(proc.stdout.readlines()[-1])
        if timer is not None:
            timer.end()

        if "unsat" in result:
            print("No Counter examples")
            return {}, []
        elif "sat" in result:
            return extract_cex(temp_filename, lib_args, library)
            print("counter example:")

        else:
            print("error")
            return {}, []

if __name__ == "__main__":
    argv = sys.argv[1:]

    parser = argparse.ArgumentParser()
    parser.add_argument('--sourcefile', nargs='?', default=None)
    parser.add_argument('--unwinds', type=int, default=25)
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
        args = shlex.split(
            "cbmc %s --no-unwinding-assertions --unwind %d --smt2 --outfile %s" % (sourcefile, unwinds, temp_filename))
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
        # should not happen?
