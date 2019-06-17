int main()
{
  int a;
  lib(a);
}

int lib()
{
  int a;
  klee_make_symbolic(&a, sizeof(int), "a");
  int count_old;
  int count_new;
  int CLEVER_ret_0_old = 0;
  int CLEVER_ret_0_new = 0;
  int i = 2;
  int count = count_old = (count_new = 0);
  while ((i < a) || (i < a))
  {
    if (i < a)
    {
      if ((a % i) != 0)
      {
        count_old++;
        count_new = 1;
      }

      i++;
    }

  }

  CLEVER_ret_0_old = count_old + 1;
  CLEVER_ret_0_new = count_new;
  klee_assume(!(CLEVER_ret_0_old == CLEVER_ret_0_new));
  printf("CEX a=%d\n", klee_get_valued(a));
  perror("A lovely CEX");
  abort();
}

