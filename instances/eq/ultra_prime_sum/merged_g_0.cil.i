# 1 "./merged_g_0.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./merged_g_0.cil.c"



extern void klee_make_symbolic(void *addr , unsigned int nbytes , char *name ) ;
extern void klee_assume(int cond ) ;
extern int ( assert)() ;
int lib(void)
{
  int i ;
  int count ;
  int a ;
  int CLEVER_ret_0_old ;
  int count_old ;
  int count_new ;
  int CLEVER_ret_0_new ;

  {
  klee_make_symbolic(& CLEVER_ret_0_new, sizeof(int ), "CLEVER_ret_0_new");
  klee_make_symbolic(& count_new, sizeof(int ), "count_new");
  klee_make_symbolic(& count_old, sizeof(int ), "count_old");
  klee_make_symbolic(& CLEVER_ret_0_old, sizeof(int ), "CLEVER_ret_0_old");
  klee_make_symbolic(& a, sizeof(int ), "a");
  klee_assume(a == 0);
  CLEVER_ret_0_new = 0;
  count_new = 0;
  count_old = 0;
  CLEVER_ret_0_old = 0;
  i = 2;
  count_new = 0;
  count_old = count_new;
  count = count_old;
  while (1) {
    if (! (i < a)) {
      if (! (i < a)) {
        break;
      }
    }
    if (i < a) {
      if (a % i != 0) {
        count_old ++;
        count_new = 1;
      }
      i ++;
    }
  }
  CLEVER_ret_0_old = count_old + 1;
  CLEVER_ret_0_new = count_new;
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
  return (0);
}
}