int main(){
    int x = nondet_int();
    int a[1000];
    for (int i =0; i < 1000; i++){
        a[i] = i;
    }
    if (x <= 1000)
     {
          int ret_old;
          int ret_new;
          int i_old = 1;
          int i_new =1;
          int max = 0;
          int maxv = a[0];
          int result_old;
          int result_new;
          int n =1000;
          while ((i_old < n) || (i_new < n))
          {
            {
              if (i_old < n)
              {
                if (a[i_old] >= a[max])
                {
                  max = i_old;
                }

                i_old++;
              }

              if (i_new < n)
              {
                if (a[i_new] >= maxv)
                {
                  maxv = a[i_new];
                }

                i_new++;
              }

            }
          }

          result_old = a[max];
          result_new = maxv;
          ret_old = result_old;
          ret_new = result_new;
          assert(result_old == result_new);
        }
    else
        return 0;
}

