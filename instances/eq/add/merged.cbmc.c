int main(void) {
	int a = nondet_int();
	int b = nondet_int();
	int c1=b+a;
	int c2=a+b;
	assert(c1 == c2);
}