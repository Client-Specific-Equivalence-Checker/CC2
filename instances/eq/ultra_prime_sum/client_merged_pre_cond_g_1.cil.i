# 1 "./client_merged_pre_cond_g_1.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./client_merged_pre_cond_g_1.cil.c"



extern void klee_make_symbolic(void *addr , unsigned int nbytes , char *name ) ;
extern void klee_assume(int cond ) ;
extern int ( lib_old)() ;
extern int ( lib_new)() ;
extern int ( assert)() ;
int client(void)
{
  int tmp ;
  int tmp___0 ;
  int sum ;
  int CLEVER_ret_0_old ;
  int CLEVER_ret_0_new ;

  {
  klee_make_symbolic(& CLEVER_ret_0_new, sizeof(int ), "CLEVER_ret_0_new");
  klee_make_symbolic(& CLEVER_ret_0_old, sizeof(int ), "CLEVER_ret_0_old");
  klee_make_symbolic(& sum, sizeof(int ), "sum");
  klee_assume(1);
  CLEVER_ret_0_new = 0;
  CLEVER_ret_0_old = 0;
  tmp = lib_old(sum);
  CLEVER_ret_0_old = tmp == 0;
  tmp___0 = lib_new(sum);
  CLEVER_ret_0_new = tmp___0 == 0;
  return (0);
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
}
}
