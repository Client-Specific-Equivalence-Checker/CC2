# define NUMPRIMES 8
static const unsigned int primes[8] = {
        2,     3,     5,     7,    11,    13,    17,    19};

int main() {
	unsigned int x;
    int ret1;
    int ret2;
    if (x < 19) {
        int x1 = 20;
        int b = 1;
        if (b == 0) {
            ret1 = 0;
            ret2 = 0;
            //assert(ret1 == ret2);
            return;
        }
        else{
            for (int i = 0; i < NUMPRIMES; i++) {
                int mod = x % primes[i];
                if (mod == 0)
                    ret1 = x == primes[i];
                    ret2 = 0;
                    //assert(ret1 == ret2);
                    return;
                }
        }
        ret1 = 1;
    }
    int b = 1;
    if (b == 0) {
        ret1 = 0;
        ret2 = 0;
        //assert(ret1 == ret2);
        return;
    }
    else{
        for (int i = 0; i < NUMPRIMES; i++) {
            int mod = x % primes[i];
            if (mod == 0)
                ret1 = x == primes[i];
                ret2 = 0;
                //assert(ret1 == ret2);
                return;
            }
    }
    ret1 = 1;
    ret2 = 1;
    //assert(ret1 == ret2);
    return;
}
