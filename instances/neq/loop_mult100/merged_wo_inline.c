struct RTuple{
    int ret_old;
    int ret_new; 
};


struct RTuple foo(int a, int b) {
    struct RTuple r;
	int c1 = 0;
    int c2 =0;
	for (int i=0; (i<a || i < b); ++i){
        if (i<a)
		    c1 += b;
        if (i <b)
            c2 -= a;
    }
    r.ret_new = c1;
    r.ret_old = c2;
	}



int main(int x, char*argv[]) {
	if (x>=85 && x<115){
	    struct RTuple r = foo(x,100);
        __CPROVER_assert(r.ret_new == r.ret_old, "VC");
    }
	return 0;}