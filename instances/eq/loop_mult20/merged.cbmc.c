int main(int x, char*argv[]) {
    int ret1 =nondet_int();
    int ret2 = nondet_int();
	if (x>=18 && x<22){
        int a = x;
        int b = 20;
	    int c1 = 0;
        int c2 = 0;
        for (int i=0; (i<a || i < b); ++i) {
            if (i<a) {
                c1 += b;
            }
            if (i <b) {
                c2 += a;
            }
        }
        ret1 = c1;
        ret2 = c2;
        assert(ret1 == ret2);
    }
	return 0;
}