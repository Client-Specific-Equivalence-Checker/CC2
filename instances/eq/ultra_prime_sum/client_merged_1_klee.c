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
    if((0 == (i <= n))&(0 == (2 < sum))){

CLEVER_ret_0_new =   1;
CLEVER_ret_0_old =   0;
sum_new =   sum;
sum_old =   sum;
i =   i;
} else 
{ 
CLEVER_ret_0_new =  99999;
sum_new =  99999;
i =  99999;

CLEVER_ret_0_old =  99999;
sum_old =  99999;}

    

pesudo_klee_make_symbolic(& CLEVER_ret_0_old, sizeof(int), " delta_CLEVER_ret_0_old");
pesudo_klee_make_symbolic(& sum_old, sizeof(int), " delta_sum_old");


pesudo_klee_make_symbolic(& CLEVER_ret_0_new, sizeof(int), " delta_CLEVER_ret_0_new");
pesudo_klee_make_symbolic(& sum_new, sizeof(int), " delta_sum_new");
pesudo_klee_make_symbolic(& i, sizeof(int), " delta_i");

  }
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
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

