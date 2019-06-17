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

