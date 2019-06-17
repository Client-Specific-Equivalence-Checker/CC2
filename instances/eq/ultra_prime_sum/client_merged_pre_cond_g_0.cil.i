# 1 "./client_merged_pre_cond_g_0.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./client_merged_pre_cond_g_0.cil.c"



extern void klee_make_symbolic(void *addr , unsigned int nbytes , char *name ) ;
extern void klee_assume(int cond ) ;
extern int ( lib_old)() ;
extern int ( lib_new)() ;
extern int ( assert)() ;
int client(void)
{
  int sum_old ;
  int sum_new ;
  int tmp ;
  int tmp___0 ;
  int sum ;
  int n ;
  int i ;
  int CLEVER_ret_1_old ;
  int CLEVER_ret_0_old ;
  int CLEVER_ret_1_new ;
  int CLEVER_ret_0_new ;

  {
  klee_make_symbolic(& CLEVER_ret_0_new, sizeof(int ), "CLEVER_ret_0_new");
  klee_make_symbolic(& CLEVER_ret_1_new, sizeof(int ), "CLEVER_ret_1_new");
  klee_make_symbolic(& CLEVER_ret_0_old, sizeof(int ), "CLEVER_ret_0_old");
  klee_make_symbolic(& CLEVER_ret_1_old, sizeof(int ), "CLEVER_ret_1_old");
  klee_make_symbolic(& i, sizeof(int ), "i");
  klee_make_symbolic(& n, sizeof(int ), "n");
  klee_make_symbolic(& sum, sizeof(int ), "sum");
  klee_assume(1);
  CLEVER_ret_0_new = 0;
  CLEVER_ret_1_new = 0;
  CLEVER_ret_0_old = 0;
  CLEVER_ret_1_old = 0;
  sum_old = sum;
  sum_new = sum;
  if (i <= n) {
    tmp = lib_old(i);
    if (tmp == 0) {
      sum_old += i;
    }
    tmp___0 = lib_new(i);
    if (tmp___0 == 0) {
      sum_new += i;
    }
    return (0);
    i ++;
  }
  CLEVER_ret_0_old = sum_old;
  CLEVER_ret_0_new = sum_new;
  CLEVER_ret_1_old = i;
  CLEVER_ret_1_new = i;
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
  assert(CLEVER_ret_1_old == CLEVER_ret_1_new);
  return (0);
}
}
