# 1 "./merged_g_1.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./merged_g_1.cil.c"



extern void klee_make_symbolic(void *addr , unsigned int nbytes , char *name ) ;
extern void klee_assume(int cond ) ;
int lib_old(int a ) ;
int lib_new(int a ) ;
extern int ( assert)() ;
int lib(void)
{
  int sum_old ;
  int sum_new ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;
  int sum ;
  int i ;
  int n ;
  int CLEVER_ret_2_old ;
  int CLEVER_ret_1_old ;
  int CLEVER_ret_0_old ;
  int CLEVER_ret_2_new ;
  int CLEVER_ret_1_new ;
  int CLEVER_ret_0_new ;

  {
  klee_make_symbolic(& CLEVER_ret_0_new, sizeof(int ), "CLEVER_ret_0_new");
  klee_make_symbolic(& CLEVER_ret_1_new, sizeof(int ), "CLEVER_ret_1_new");
  klee_make_symbolic(& CLEVER_ret_2_new, sizeof(int ), "CLEVER_ret_2_new");
  klee_make_symbolic(& CLEVER_ret_0_old, sizeof(int ), "CLEVER_ret_0_old");
  klee_make_symbolic(& CLEVER_ret_1_old, sizeof(int ), "CLEVER_ret_1_old");
  klee_make_symbolic(& CLEVER_ret_2_old, sizeof(int ), "CLEVER_ret_2_old");
  klee_make_symbolic(& n, sizeof(int ), "n");
  klee_make_symbolic(& i, sizeof(int ), "i");
  klee_make_symbolic(& sum, sizeof(int ), "sum");
  klee_assume(((sum == 0) & (i == 1)) & (n == 0));
  CLEVER_ret_0_new = 0;
  CLEVER_ret_1_new = 0;
  CLEVER_ret_2_new = 0;
  CLEVER_ret_0_old = 0;
  CLEVER_ret_1_old = 0;
  CLEVER_ret_2_old = 0;
  sum_old = sum;
  sum_new = sum;
  while (1) {
    if (! (i <= n)) {
      if (! (i <= n)) {
        break;
      }
    }
    if (i <= n) {
      tmp = lib_old(i);
      if (tmp == 0) {
        sum_old += i;
      }
      tmp___0 = lib_new(i);
      if (tmp___0 == 0) {
        sum_new += i;
      }
      i ++;
    }
  }
  tmp___1 = lib_old(sum_old);
  CLEVER_ret_0_old = tmp___1 == 0;
  tmp___2 = lib_new(sum_new);
  CLEVER_ret_0_new = tmp___2 == 0;
  CLEVER_ret_1_old = sum_old;
  CLEVER_ret_1_new = sum_new;
  CLEVER_ret_2_old = i;
  CLEVER_ret_2_new = i;
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
  assert(CLEVER_ret_1_old == CLEVER_ret_1_new);
  assert(CLEVER_ret_2_old == CLEVER_ret_2_new);
  return (0);
}
}
int lib_old(int a )
{
  int i ;
  int count ;

  {
  i = 2;
  count = 0;
  while (i < a) {
    if (a % i != 0) {
      count ++;
    }
    i ++;
  }
  return (count + 1);
}
}
int lib_new(int a )
{
  int i ;
  int count ;

  {
  i = 2;
  count = 0;
  while (i < a) {
    if (a % i != 0) {
      count = 1;
    }
    i ++;
  }
  return (count);
}
}
