
# define NUMPRIMES 8
static const unsigned int primes[8] = {
        2,     3,     5,     7,    11,    13,    17,    19};




int client(unsigned int x){
  int ret_new = 0;
  int ret_old = 0;
  if (x < 19) {
    int x = 20;
    int b = 1;
    if (b == 0) {
    ret_new = 0;
    ret_old = 0;
    }
    else{
        for (int i = 0; i < NUMPRIMES; i++) {
        int mod = x % primes[i];
        if (mod == 0)
            ret_new = primes[i];
            ret_old = 0;
            __CPROVER_assert( (ret_new == ret_old),  "VC1");
        }
    }
    return 0;
  }
  int x = x;
  int b = 1;
  if (b == 0) {
    ret_new = 0;
    ret_old = 0;
    }
    else{
        for (int i = 0; i < NUMPRIMES; i++) {
        int mod = x % primes[i];
        if (mod == 0)
            ret_new = primes[i];
            ret_old = 0;
            __CPROVER_assert( (ret_new == ret_old),  "VC1");
        }
    }
  return 0;
}



int main() {
	int x = nondet_int();
	client(x);
}
