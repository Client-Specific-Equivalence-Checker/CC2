int int_array[] = {1,2,0,3,4,5,6,8,9,10};

int lib(int n) {
        if (n <= 1) return n;
        return n + n-1 + sum(n-2);
}


//find the missing integer in a 10 integer ascending sequence
int client() {
    int actual_sum = 0;
    for (int i=0; i < 10; i++){
        actual_sum += int_array[i];
    }

    int ret_old =0;
    int ret_new = 0;
    int n1 = 10;
    int n2 = 10
    while (n1 > 1 || n2 > 1){
        if (n1 > 1){
            ret_old += n;
            n -= 1;
        }
        if (n2 > 1){
            ret_new += (n + (n-1));
            ret_new -= 2;
        }
    }
    assert(actual_sum- ret_new == actual_sum --ret_old);
}