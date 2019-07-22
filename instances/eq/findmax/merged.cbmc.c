int main(){
    int x = nondet_int();
    int a[1000];
    for (int i =0; i < 1000; i++){
        a[i] = i;
    }
    if (x <= 1000)
     {
  int n = 1000;
  int result_old;
  int result_new;
  int ret_old;
  int ret_new;
  int i = 1;
  int max_old = 0;
  int maxv_new = a[0];
  int result;
  while ((i < n) || (i < n))
  {
    if (i < n)
    {
      if (a[i] >= a[max_old])
      {
        max_old = i;
      }

      if (a[i] >= maxv_new)
      {
        maxv_new = a[i];
      }

      i++;
    }

  }

  result_old = a[max_old];
  result_new = maxv_new;
  ret_old = result_old;
  ret_new = result_new;
  assert(ret_new == ret_old);
}
    else
        return 0;
}

