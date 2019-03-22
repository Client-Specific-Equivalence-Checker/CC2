int ret_new = 0;
int ret_old = 0;

int lib(int n){
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
}



int factorial(int x){
    if(x<5){
        lib(x);
        assert(ret_new == ret_old);
    }else{
        return 0;
    }
}

