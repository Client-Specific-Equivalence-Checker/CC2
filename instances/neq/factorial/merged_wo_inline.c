
struct RTuple{
    int ret_old;
    int ret_new; 
};

struct RTuple lib(int n){
    struct RTuple r;
    if(n <= 0){
        r.ret_old = 0;
        r.ret_new = 1;
        return r;
    }else{
        // old 
        int n1 = n;
        int acc =1;
        int x = 1;
        while (x < n1 + 1){
            acc = acc * x;
            x = x+1;
        }
        r.ret_old= acc;

        //new
        int n2 = n;
        r.ret_new = n2 * lib(n2-1).ret_new;

        return r;
    }
}

int lib(int n){
    if(n > 0){
        int acc = 1;
        int x = 1;
        while(x < n + 1){
            acc = acc * x;
            x = x+1;
        }
        return acc;
    }
    return 0;
}

int factorial(int x){
    if(x<5){
        struct RTuple r = lib(x);
        assert(r.ret_new == r.ret_old);
    }else{
        return 0;
    }
}

