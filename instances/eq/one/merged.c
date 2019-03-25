int main() {
	int x;//=2659237091;
  
  int x1 = x;
  int x2 = x;
  int lib_ret1;
  int lib_ret2;
  //TODO should we synchronize on library conditions?
	if (x1 > 10) {
		lib_ret1 = 11;
	} else {
		lib_ret1 = x1;
  }

	if (x2 > 10) {
		lib_ret2 = 12;
	} else {
		lib_ret2 = x2+1;
  }

	if (x1 > lib_ret1 && x2 > lib_ret2) {
		ret1 = x1;
    ret2 = x2;
  } else if (!(x1 > lib_ret1) && x2 > lib_ret2) {
		ret1 = lib_ret1;
    ret2 = x2;
  } else if (x1 > lib_ret1 && !(x2 > lib_ret2)) {
		ret1 = x1;
    ret2 = lib_ret2;
  } else if (!(x1 > lib_ret1) && !(x2 > lib_ret2)) {
		ret1 = lib_ret1;
    ret2 = lib_ret2;
  }
  //assert(ret1 == ret2);
	return 0;
}

