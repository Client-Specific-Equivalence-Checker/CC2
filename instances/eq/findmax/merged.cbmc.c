int main(){
    int x = nondet_int();
    int a[1000];
    for (int i =0; i < 1000; i++){
        a[i] = i;
    }
    if (x <= 1000)
     {
          int n =x;
          int ret_old;
          int ret_new;
          int i = 1;
          int max = 0;
          int maxv = a[0];
          int result_old;
          int result_new;
          while (i < n)
          {
              if (a[i] >= a[max])
              {
                max = i;
                maxv = a[i];
              }
              i++;
          }

          result_old = a[max];
          result_new = maxv;
          assert(result_old == result_new);
        }
    else
        return 0;
}

