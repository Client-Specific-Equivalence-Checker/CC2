int main()
{
  int n;
  client(n);
}


int client(int n)
{
  int sum_old;
  int sum_new;
  int CLEVER_ret_0_old = 0;
  int CLEVER_ret_0_new = 0;
  int i = 0;
  int sum = sum_old = (sum_new = 0);
  {
    int temp_old = lib_old(sum, i, n);
    int temp_new = lib_new(sum, i, n);
  }
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
}


