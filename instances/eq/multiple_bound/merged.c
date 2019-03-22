int main() {
	int x;
    int ret1;
    int ret2;
	if (x < -100 || x > 100) {
		return x;
	}
	x = x*5*6;
	if ((x % 6) == 0) {
		ret1 = 1;
	} else {
		ret1 = 0;
	}
	if ((x % 5) == 0) {
		ret2 = 1;
	} else {
		ret2 = 0;
	}
    //assert(ret1 == ret2);
}
