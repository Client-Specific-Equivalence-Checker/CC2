int main(int x, char*argv[]) {
    int ret1;
    int ret2;
	if (x>=18 && x<22){
        int a = x;
        int b = 100;
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
        //assert(ret1 == ret2);
    }
	return 0;
}