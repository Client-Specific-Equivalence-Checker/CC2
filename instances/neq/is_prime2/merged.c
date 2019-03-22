int ret_new = 0;
int ret_old = 0;
# define NUMPRIMES 8
static const unsigned int primes[8] = {
        2,     3,     5,     7,    11,    13,    17,    19};

struct RTuple{
    int ret_old;
    int ret_new; 
};

struct RTuple lib(unsigned int x, int b) {
  struct RTuple r;
  if (b == 0) {
    r.ret_new = 0;
    r.ret_old = 0;
    return r;
  }
  else{
    for (int i = 0; i < NUMPRIMES; i++) {
      int mod = x % primes[i];
      if (mod == 0)
        r.ret_new = primes[i];
        r.ret_old = 0;
        return r;
    }
  }
  r.ret_new = 1;
  r.ret_old = 1;
  return r;
}



int client(unsigned int x){
  if (x < 19) {
    struct RTuple r = lib(20, 1);
    __CPROVER_assert( (r.ret_new == r.ret_old),  "VC");
    return 0;
  }
  struct RTuple r = lib(x,1);
   __CPROVER_assert( (r.ret_new == r.ret_old),  "VC");
  return 0;
}



int main() {
	int x = nondet_int();
	client(x);
}
