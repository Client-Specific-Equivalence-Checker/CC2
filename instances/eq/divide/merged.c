int main(int c, int d) {
  if (d == 0) {
    return 0;
  }
  int x = c;
  int y = d;
  int ret1;
  if (y == 0) {
    ret1 = 0;
  } else {
    ret1 = x / y;
  }
  int ret2 = x / y;
  //assert(ret1 == ret2);
}
