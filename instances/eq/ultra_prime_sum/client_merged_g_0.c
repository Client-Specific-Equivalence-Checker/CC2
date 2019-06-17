int client(int sum, int n, int i, int CLEVER_ret_1_old, int CLEVER_ret_0_old, int CLEVER_ret_1_new, int CLEVER_ret_0_new)
{
  CLEVER_ret_0_new = 0;
  CLEVER_ret_1_new = 0;
  CLEVER_ret_0_old = 0;
  CLEVER_ret_1_old = 0;
  int sum_old = sum;
  int sum_new = sum;
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

  CLEVER_ret_0_old = sum_old;
  CLEVER_ret_0_new = sum_new;
  CLEVER_ret_1_old = i;
  CLEVER_ret_1_new = i;
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
  assert(CLEVER_ret_1_old == CLEVER_ret_1_new);
}

int lib_old(int a)
{
  if ((((((((((((((((((((((((((0 == (0 == (a % 8))) & (0 == (0 == (a % 11)))) & (6 < a)) & (0 == (0 == (a % 10)))) & (13 < a)) & (0 == (a % 7))) & (0 == (0 == (a % 5)))) & (0 == (14 < a))) & (0 == (0 == (a % 6)))) & (7 < a)) & 1) & (0 == (0 == (a % 3)))) & (0 == (0 == (a % 4)))) & (10 < a)) & (12 < a)) & (0 == (a % 2))) & (9 < a)) & (0 == (0 == (a % 9)))) & (3 < a)) & (2 < a)) & (4 < a)) & (0 == (0 == (a % 13)))) & (0 == (0 == (a % 12)))) & (11 < a)) & (5 < a)) & (8 < a))
  {
    return 10;
  }

  return 99999;
}

int lib_new(int a)
{
  if ((((((((((((((((((((((((((0 == (0 == (a % 8))) & (0 == (0 == (a % 11)))) & (6 < a)) & (0 == (0 == (a % 10)))) & (13 < a)) & (0 == (a % 7))) & (0 == (0 == (a % 5)))) & (0 == (14 < a))) & (0 == (0 == (a % 6)))) & (7 < a)) & 1) & (0 == (0 == (a % 3)))) & (0 == (0 == (a % 4)))) & (10 < a)) & (12 < a)) & (0 == (a % 2))) & (9 < a)) & (0 == (0 == (a % 9)))) & (3 < a)) & (2 < a)) & (4 < a)) & (0 == (0 == (a % 13)))) & (0 == (0 == (a % 12)))) & (11 < a)) & (5 < a)) & (8 < a))
  {
    return 1;
  }

  return 99999;
}

