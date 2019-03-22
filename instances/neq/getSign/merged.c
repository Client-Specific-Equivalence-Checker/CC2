int ret_new = 0;
int ret_old = 0;

int lib(int x) {
  if (x <= 0 )
     return ret_new = -1;
  else
     return ret_new = 1;
  if (x == 0)
    ret_old =0;
  if (x < 0)
    ret_old = -1;
  else
    ret_old = 1;
  
}


int client(int x){
    lib(x);
    assert(ret_old == ret_new);
}

int main() {
	int x;
	return client(x);
}
