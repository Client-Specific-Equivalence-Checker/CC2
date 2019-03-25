# define NUMPRIMES 8
static const unsigned int primes[8] = {
        2,     3,     5,     7,    11,    13,    17,    19};


int lib_new(unsigned int x, int b) {
  if (b == 0) {
    return 0;
  }
  else{
    for (int i = 0; i < NUMPRIMES; i++) {
      int mod = x % primes[i];
      if (mod == 0)
        return x == primes[i];
    }
  }
  return 1;
}

int client_new(unsigned int x){
  if (x < 19) {
    return lib_new(20, 1);
  }
  return lib_new(x,1);
}

int lib_old(unsigned int x, int b) {
  if (b == 0) {
    return 0;
  }
  else{
    for (int i = 0; i < NUMPRIMES; i++) {
      int mod = x % primes[i];
      if (mod == 0)
        return 0;
    }
  }
  return 1;
}

int client_old(unsigned int x){
  if (x < 19) {
    return lib_old(20, 1);
  }
  return lib_old(x,1);
}

int main() {
	unsigned int x= nondet_uint();
	assert(client_new(x) == client_old(x));
}
