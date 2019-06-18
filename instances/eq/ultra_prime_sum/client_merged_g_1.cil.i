# 1 "./client_merged_g_1.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./client_merged_g_1.cil.c"



extern void klee_make_symbolic(void *addr , unsigned int nbytes , char *name ) ;
extern void klee_assume(int cond ) ;
int lib_old(int a ) ;
int lib_new(int a ) ;
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
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
  return (0);
}
}
int lib_old(int a )
{


  {
  if ((((((((((((((((((((((((((0 == (0 == a % 8)) & (0 == (0 == a % 11))) & (6 < a)) & (0 == (0 == a % 10))) & (13 < a)) & (0 == a % 7)) & (0 == (0 == a % 5))) & (0 == (14 < a))) & (0 == (0 == a % 6))) & (7 < a)) & 1) & (0 == (0 == a % 3))) & (0 == (0 == a % 4))) & (10 < a)) & (12 < a)) & (0 == a % 2)) & (9 < a)) & (0 == (0 == a % 9))) & (3 < a)) & (2 < a)) & (4 < a)) & (0 == (0 == a % 13))) & (0 == (0 == a % 12))) & (11 < a)) & (5 < a)) & (8 < a)) {
    return (10);
  }
  return (99999);
}
}
int lib_new(int a )
{


  {
  if ((((((((((((((((((((((((((0 == (0 == a % 8)) & (0 == (0 == a % 11))) & (6 < a)) & (0 == (0 == a % 10))) & (13 < a)) & (0 == a % 7)) & (0 == (0 == a % 5))) & (0 == (14 < a))) & (0 == (0 == a % 6))) & (7 < a)) & 1) & (0 == (0 == a % 3))) & (0 == (0 == a % 4))) & (10 < a)) & (12 < a)) & (0 == a % 2)) & (9 < a)) & (0 == (0 == a % 9))) & (3 < a)) & (2 < a)) & (4 < a)) & (0 == (0 == a % 13))) & (0 == (0 == a % 12))) & (11 < a)) & (5 < a)) & (8 < a)) {
    return (1);
  }
  return (99999);
}
}