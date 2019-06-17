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

    return 0;
    i++;
  }

  CLEVER_ret_0_old = sum_old;
  CLEVER_ret_0_new = sum_new;
  CLEVER_ret_1_old = i;
  CLEVER_ret_1_new = i;
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
  assert(CLEVER_ret_1_old == CLEVER_ret_1_new);
}

