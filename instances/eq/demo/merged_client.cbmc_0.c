int client(int n, int ret_new, int ret_old) {
        int count = 0;
    while (n >= 1000){
        n = n/ 1000;
        count += 3;
    }
    __CPROVER_assume(n < 1000);
    int digit_old = count + ret_old;
    int digit_new = count + ret_new;
    __CPROVER_assume(n == 10 && ret_old ==2 && ret_new == 1);
    if ((n % 10) != 0){
        assert(digit_old == digit_new);
    }else{
       return 0;
    }
}

int main(){
    int n;
    int ret_new;
    int ret_old;
    client(n, ret_new, ret_old);

}
