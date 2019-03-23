
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

int factorial(int x){
    if(x<5){
        struct RTuple r = lib(x);
        __CPROVER_assert(r.ret_new == r.ret_old, "vc1");
    }else{
        return 0;
    }
}

int main(){
    int x = nondet_int();
    return factorial(x);
}

