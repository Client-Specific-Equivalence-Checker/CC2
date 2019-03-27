struct RTuple{
    int ret_old;
    int ret_new;
};

struct RTuple lib(int x) {
  struct RTuple r;
  if (x <= 0 )
      r.ret_new = -1;
  else
      r.ret_new = 1;
  if (x == 0)
    r.ret_old =0;
  if (x < 0)
    r.ret_old = -1;
  else
    r.ret_old = 1;
  return r;
}


int client(int x){
    struct RTuple r = lib(x);
    __CPROVER_assert(r.ret_old == r.ret_new, "vc");
}

int main() {
	int x = nondet_int();
	return client(x);
}
