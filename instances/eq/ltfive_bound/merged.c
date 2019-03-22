int main() {
	int x;
	if (x < -100 || x > 100) {
		return x;
	}
    int ret1;
    int ret2;
    if (x < 0) {
        int x1 = (-x)*5;
        if (x1 < 0) {
            ret1 = 0;
        } else {
            ret1 = x1;
        }
        ret1 = -ret1/5;
	} else {
        int x1 = (x+1)*5;
        if (x1 < 0) {
            ret1 = 0;
        } else {
            ret1 = x1;
        }
        ret1 = ret1/5 - 1;
	}
    if (x < 5) {
        int x1 = (-x)*5;
        if (x1 < 0) {
            ret2 = 0;
        } else {
            ret2 = x1;
        }
        ret2 = -ret2/5;
	} else {
        int x1 = (x+1)*5;
        if (x1 < 0) {
            ret2 = 0;
        } else {
            ret2 = x1;
        }
        ret2 = ret2/5 - 1;
	}
    //assert(ret1 == ret2);
}
