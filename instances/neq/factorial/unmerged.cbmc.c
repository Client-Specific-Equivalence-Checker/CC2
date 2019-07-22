int lib_new(int n){
    if(n <= 0){
        return 1;
    }else{
        return n * lib_new(n-1);
    }
}

int factorial_new(int x){
    if(x<5){
        return lib_new(x);
    }else{
        return 0;
    }
}

int lib_old(int n){
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


int factorial_old(int x){
    if(x<5){
        return lib_old(x);
    }else{
        return 0;
    }
}

int main(){
    int x = nondet_int();
    assert(factorial_new(x) == factorial_old(x));
}