typedef struct t {
	int data;
	struct t* next;
} st;

st *my;


int lib(st *s) {
	int x = 1;
	 s -> data = x;
	return 0;
}


int client() {
	int ret_old;
    int ret_new;
    int x = 1;
    s->data = x;
    ret_old = 0;
    ret_new = 1;
	assert( (ret_old < 10) == (ret_new < 10)) ;
}