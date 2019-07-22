int lib_old(int x, int y) { return x / y; }

int client_old(int c, int d) {
  if (d == 0) {
    return 0;
  }
  return lib_old(c, d);
}

int lib_new(int x, int y) {
  if (y == 0) {
    return 0;
  }
  return x / y;
}

int client_new(int c, int d) {
  if (d == 0) {
    return 0;
  }
  return lib_new(c, d);
}
int main() {
  int a = nondet_int();
  int b= nondet_int();
  assert ( client_old(a, b) == client_new(a, b));
}
