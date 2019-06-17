# 1 "merged_g_0.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "merged_g_0.c"
int lib(int a, int CLEVER_ret_0_old, int count_old, int count_new, int CLEVER_ret_0_new)
{
  CLEVER_ret_0_new = 0;
  count_new = 0;
  count_old = 0;
  CLEVER_ret_0_old = 0;
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
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
}
