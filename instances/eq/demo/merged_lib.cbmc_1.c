int lib(int n) {
  int ret_old;
  int ret_new;
  if (n < 0)
  {
    ret_old = -1;
    ret_new = -1;
  }
  else
  {
    if (n < 10)
      ret_old = 1;
    else
      if (n < 100)
      ret_old = 2;
    else
      if (n < 1000)
      ret_old = 3;
    else
      ret_old = -1;



    if (n <= 10)
      ret_new = 1;
    else
      if (n <= 100)
      ret_new = 2;
    else
      if (n <= 1000)
      ret_new = 3;
    else
      ret_new = -1;
  }

  assert(ret_old == ret_new);

}


int main(){

    int n = nondet_int();
    __CPROVER_assume(n < 1000);
    __CPROVER_assume(n !=  10);
    lib(n);
}



