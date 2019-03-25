int main() {
    int x = nondet_int();
    int ret1;
    int ret2;
    if (x > 0) {
        if (x == 0) {
            ret2 = 0;
        }else if (x < 0) {
            ret2 = -1;
        } else {
            ret2 = 1;
        }
        if (x <= 0){ 
            ret1 = -1;
        } else {
            ret1 = 1;
        }
    }
    ret1 = x;
    ret2 = x;
    assert(ret1 == ret2);
}
