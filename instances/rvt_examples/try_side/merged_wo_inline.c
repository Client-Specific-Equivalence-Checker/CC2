struct RTuple{
    int ret_old;
    int ret_new;
};

struct RTuple ident(int n) {
struct RTuple r;
r.ret_old = n;
int j, i = 0;

for (j = 0; j < n -  i; j++) ;
	r.ret_new= j  ;

return r;
}

int sum(int n) {
     struct RTuple client;
	 struct RTuple r = ident(n);
		if (r.ret_new <= 1 ){
            client.ret_new = r.ret_new;
		}else{
		    client.ret_new = n + sum(n-1).ret_new;
		}

		if (r.ret_old <= 1){
		     client.ret_old = r.ret_old;
		}else{
		    client.ret_old = n + sum(n-1).ret_old;
		}
		assert(client.ret_old == client.ret_new);
		return client;
}

int main() {
int n;
return sum(n);
}