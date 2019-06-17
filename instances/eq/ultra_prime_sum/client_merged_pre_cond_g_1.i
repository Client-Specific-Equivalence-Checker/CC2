# 1 "client_merged_pre_cond_g_1.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "client_merged_pre_cond_g_1.c"
int client(int sum, int CLEVER_ret_0_old, int CLEVER_ret_0_new)
{
  CLEVER_ret_0_new = 0;
  CLEVER_ret_0_old = 0;
  {
    CLEVER_ret_0_old = lib_old(sum) == 0;
    CLEVER_ret_0_new = lib_new(sum) == 0;
    return 0;
  }
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
}
