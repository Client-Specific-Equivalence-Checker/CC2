int main(int x, char*argv[]) {
  int ret1;
  int ret2;

	if (x>=33 && x<47) {
    int a = x;
    int b = 40;
    //inline function
    int c1 = 0;
    int c2 = 0;
    for (int i=0; (i<a || i<b); ++i) {
      //Note: Why not also copy i?
      if (i<a) {
	      c1 += b;
      }
      if (i<b) {
	      c2 += a;
      }
    }
    ret1 = c1;
    ret2 = c2;
    //assert(ret1 == ret2);
  }
	return 0;
}
