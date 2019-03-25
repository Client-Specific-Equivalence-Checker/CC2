int main() {
	int x;//=3089104896;
  int ret1;
  int ret2;

  int x1 = x;
  int x2 = x;
  int lib_ret1;
  int lib_ret1neg;
  int lib_ret2;
  int lib_ret1neg;

  if ((x1 > 0) && (x2 > 0)) {
      //slightly coarse grained merge on lib again!
      int negx1 = -x1;
     	if (negx1 < 0){
		    lib_ret1neg = -negx1;
	    }else{
		    lib_ret1neg = negx1;
	    }

      int negx2 = -x2;
     	int counter = 0;
	    while (negx2 < 0) {
		    negx2++;
		    counter++;
	    }
	    lib_ret2neg = counter;

      ret1 = -lib_ret1neg;
      ret2 = -lib_ret2neg;
  }/* else if (!(x1 > 0) && (x2 > 0)) { //TODO:valid to remove infeasible paths?
      ret1 = lib_ret1;
      ret2 = -lib_ret2neg;
  } else if ((x1 > 0) && !(x2 > 0)) {
      ret1 = -lib_ret1neg;
      ret2 = lib_ret2;
  } */else if (!(x1 > 0) && !(x2 > 0)) {

     	if (x1 < 0){
		    lib_ret1 = -x1;
	    }else{
		    lib_ret1 = x1;
	    }

     	int counter = 0;
	    while (x2 < 0) {
		    x2++;
		    counter++;
	    }
	    lib_ret2 = counter;
      
      ret1 = lib_ret1;
      ret2 = lib_ret2;
  }
  //assert(ret1 == ret2);
	return 0;
}
