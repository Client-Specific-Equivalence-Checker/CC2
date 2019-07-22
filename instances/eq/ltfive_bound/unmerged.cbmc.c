int lib_new(int x) {
	if (x < 0)
		return 0;
	else
		return x;
}

int client_new(int x){
	if (x < -100 || x > 100) {
		return x;
	}
	if (x < 0){
		return -lib_new((-x)*5)/5;
	}else{
		return lib_new((x+1)*5)/5 - 1;
	}
}

int lib_old(int x) {
	if (x < 5)
		return 5;
	else
		return x;
}

int client_old(int x){
	if (x < -100 || x > 100) {
		return x;
	}
	if (x < 0){
		return -lib_old((-x)*5)/5;
	}else{
		return lib_old((x+1)*5)/5 - 1;
	}
}

int main() {
	int x = nondet();
	assert(client_old(x) == client_new(x));
}
