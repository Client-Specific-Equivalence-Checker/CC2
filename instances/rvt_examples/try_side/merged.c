
int ident(int n) {
int j, i = 0;

for (j = 0; j < n -  i; j++) ;
	return j  ;
}


int sum(int n) {
	    int ret_old = n;
	    int j, i = 0;
	    for (j = 0; j < n -  i; j++) ;
        int ret_new = j;
		if (n <= 1)
		    assert(ret_old == ret_new);
		    return ret_old;
	    assert(ret_old == ret_new);
		sum(n-1);
}

int main() {
int n;
return sum(n);
}