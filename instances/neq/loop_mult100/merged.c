int main(int x, char*argv[]) {
	if (x>=85 && x<115){
        int ret_new = 0;
        int ret_old = 0;
        int a =x;
        int b = 100;
        int c1 = 0;
        int c2 =0;
        for (int i=0; (i<a || i < b); ++i){
            if (i<a)
                c1 += b;
            if (i <b)
                c2 -= a;
        }
        ret_new = c1;
        ret_old = c2;
        __CPROVER_assert(ret_new == ret_old, "VC");
        }
    return 0;
    }
	
