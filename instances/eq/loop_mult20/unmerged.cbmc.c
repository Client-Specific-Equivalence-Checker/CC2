int foo(int a, int b);

int main(){
    int x = nondet_int();
    assert(client_new(x) == client_old(x)); 

}
int client_new(int x) {
	if (x>=18 && x<22)
		return foo_new(x,20);
	return 0;
}

int foo_new(int a, int b) {
	int c=0;
	for (int i=1;i<=a;++i)
		c+=b;
	
	return c;
}

int client_old(int x) {
	if (x>=18 && x<22)
		return foo_old(x,20);
	return 0;
}

int foo_old(int a, int b) {
	int c=0;
	for (int i=1;i<=b;++i)
		c+=a;
	
	return c;
}

