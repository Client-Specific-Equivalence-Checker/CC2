int lib_new(int x) {
  if (x <= 0)
     return -1;
  else
     return 1;
}

int client_new(int x){
  if (x > 0) {
    return lib_new(x);
  }
  return x;
}

int lib_old(int x) {
  if (x == 0)
     return 0;
  if (x < 0)
     return -1;
  else
     return 1;
}

int client_old(int x){
  if (x > 0) {
    return lib_old(x);
  }
  return x;
}

int main() {
	int x = nondet_int();
	assert(client_new(x) == client_old(x));
}
