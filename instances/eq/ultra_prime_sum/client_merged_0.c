int main()
{
  int sum;
  int i;
  int n;
  client(sum, i, n);
}


int client(int sum, int i, int n)
{
  int sum_old = sum;
  int sum_new = sum;
  int CLEVER_ret_1_old = 0;
  int CLEVER_ret_1_new = 0;
  int CLEVER_ret_0_old = 0;
  int CLEVER_ret_0_new = 0;
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
if((0 == (2 < a))){
return   1;
}
return 99999;
}


int lib_new(int a)
{
if((0 == (2 < a))){
return   0;
}
return 99999;
}


