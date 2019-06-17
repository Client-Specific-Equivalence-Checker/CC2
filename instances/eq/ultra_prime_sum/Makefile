CILLY=cilly
CLANG=clang-6.0
KLEE=klee
COPTS=-Wno-attributes
INSTKLEE=/home/fengnick/CLEVER+/klee/_build/instKlee.cma
# if instKlee has been installed, you can also use:
# INSTKLEE=instKlee

export CIL_FEATURES=cil.oneret

.PHONY: all clean

merged_g_1:merged_g_1.c
	$(CILLY) $(COPTS) --save-temps --noPrintLn -c --load=$(INSTKLEE) --doinstKlee --entry=lib  --assume='sum == '0' & i == '1' & n == '0'' merged_g_1.c

clean:
	rm -rf *.o *.i *.cil.* klee-*
