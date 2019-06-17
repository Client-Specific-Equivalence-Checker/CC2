extern void klee_make_symbolic(void *addr, unsigned int nbytes, char *name);
extern void klee_assume(int cond);
extern int lib_old();
extern int lib_new();
extern int assert();
int client(void)
{
  int tmp;
  int tmp___0;
  int sum;
  int CLEVER_ret_0_old;
  int CLEVER_ret_0_new;
  {
    klee_make_symbolic(&CLEVER_ret_0_new, sizeof(int), "CLEVER_ret_0_new__CLEVER_EXT");
    klee_make_symbolic(&CLEVER_ret_0_old, sizeof(int), "CLEVER_ret_0_old__CLEVER_EXT");
    klee_make_symbolic(&sum, sizeof(int), "sum__CLEVER_EXT");
    klee_assume(1);
    CLEVER_ret_0_new = 0;
    CLEVER_ret_0_old = 0;
    int input_a_old;
    klee_make_symbolic(&input_a_old, sizeof(int), "input_a_old");
    input_a_old = sum;
    CLEVER_ret_0_old = tmp == 0;
    int input_a_new;
    klee_make_symbolic(&input_a_new, sizeof(int), "input_a_new");
    input_a_new = sum;
    CLEVER_ret_0_new = tmp___0 == 0;
    return 0;
    //assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
  }
}

