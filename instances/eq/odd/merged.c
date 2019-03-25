//Chunky COARSE-grained merge!
int main() {
	int x;

  int ret1;
  int ret2;

  int x1 = x;
  int x2 = x;
  int lib_ret1;
  int lib_ret2;
  lib_ret1 = (x1+1) % 2;

	int counter = 0;
	while (x2 % 2 == 0){
		x2 = x2/2;
		counter++;
	}
	lib_ret2 = counter;
  //sync pt, return value of lib(x)
  //OBSERVE: made if-else a (tighter) 4 way fork?
	if (lib_ret1==0 && lib_ret2==0){
	   	ret1 = 1;
      ret2 = 1;
	}else if (lib_ret1==0 && lib_ret2==1){
	   	ret1 = 1;
      ret2 = 0;
	}else if(lib_ret1==1 && lib_ret2==0){
	   	ret1 = 0;
      ret2 = 1;
	}else if(lib_ret1==1 && lib_ret2==1){
	   	ret1 = 0;
      ret2 = 0;
	}
  //assert(ret1 == ret2);
  return;
}

