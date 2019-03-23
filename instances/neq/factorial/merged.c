




int factorial(int n){
    int ret_new = 0;
    int ret_old = 0;
    if(n<5){
        if(n <= 0){
            ret_new =1;
            ret_old = 0;
        }else{
            int n1 = n;
            int n2 = n;
            int acc = 1;
            int x = 1;
            //merged loop
            while ((n1-1 > 0) || (x < n2 +1)){
                
                if (n1-1 > 0){
                    n1 = n1 * (n1-1);
                    n1--;
                }

                if ((x < n2 +1)){
                    acc = acc * x;
                    x = x+1;
                }

            }
            ret_new = n1;
            ret_old = acc;
        }
        __CPROVER_assert(ret_new == ret_old, "vc1");
    }else{
        return 0;
    }
}

int main(){
    int x = nondet_int();
    return factorial(x);
}