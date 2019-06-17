int main()
{
  int sum;
  int i;
  int n;
  lib(sum, i, n);
}

int lib()
{
  int sum;
  klee_make_symbolic(&sum, sizeof(int), "sum");
  int i;
  klee_make_symbolic(&i, sizeof(int), "i");
  int n;
  klee_make_symbolic(&n, sizeof(int), "n");
  int sum_old = sum;
  int sum_new = sum;
  int CLEVER_ret_2_old = 0;
  int CLEVER_ret_2_new = 0;
  int CLEVER_ret_1_old = 0;
  int CLEVER_ret_1_new = 0;
  int CLEVER_ret_0_old = 0;
  int CLEVER_ret_0_new = 0;
  while ((i <= n) || (i <= n))
  {
    if (i <= n)
    {
      if (lib_old(i) == 0)
      {
        sum_old += i;
      }

      if (lib_new(i) == 0)
      {
        sum_new += i;
      }

      i++;
    }

  }

  CLEVER_ret_0_old = lib_old(sum_old) == 0;
  CLEVER_ret_0_new = lib_new(sum_new) == 0;
  CLEVER_ret_1_old = sum_old;
  CLEVER_ret_1_new = sum_new;
  CLEVER_ret_2_old = i;
  CLEVER_ret_2_new = i;
  klee_assume(!(((CLEVER_ret_0_old == CLEVER_ret_0_new) & (CLEVER_ret_1_old == CLEVER_ret_1_new)) & (CLEVER_ret_2_old == CLEVER_ret_2_new)));
  printf("CEX sum=%d,i=%d,n=%d\n", klee_get_valued(sum), klee_get_valued(i), klee_get_valued(n));
  perror("A lovely CEX");
  abort();
}

int lib_old(int a)
{
  int i = 2;
  int count = 0;
  while (i < a)
  {
    if ((a % i) != 0)
    {
      count++;
    }

    i++;
  }

  return count + 1;
}

int lib_new(int a)
{
  int i = 2;
  int count = 0;
  while (i < a)
  {
    if ((a % i) != 0)
    {
      count = 1;
    }

    i++;
  }

  return count;
}

