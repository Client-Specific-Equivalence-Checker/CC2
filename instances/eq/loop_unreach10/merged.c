int ret_new = 0;
int ret_old = 0;

int foo(int a, int b) {
	int c1 = 0;
    int c2 = 0;
	if (a < 0) {
		for (int i=1;(i<=a || i <= b) ;++i) {
            if (i<=a) {
			    c1 += b;
            }
            if (i <= b) {
                c2 += a;
            }
        }
	}
	ret_new = c1;
    ret_old = c2;
}

int main(int x, char*argv[]) {                
	if (x>=9 && x<12){               
		foo(x,100);
        //assert(ret_new == ret_old);
    }                
	return 0;
}