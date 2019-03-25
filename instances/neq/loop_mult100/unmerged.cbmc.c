int foo_new(int a, int b) {
	int c = 0;
	for (int i=0; i<a; ++i)
		c += b;
	return c;}

int client_new(int x) {
	if (x>=85 && x<115)
		return foo_new(x,100);
	return 0;}

int foo_old(int a, int b) {
	int c = 0;
	for (int i=0; i<b; ++i)
		c -= a;
	return c;}

int client_old(int x) {
	if (x>=85 && x<115)
		return foo_old(x,100);
	return 0;}

int main(){
    int x = nondet_int();
    assert(client_new(x) == client_old(x));
}
