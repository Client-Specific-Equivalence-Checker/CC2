#include "seahorn/seahorn.h"
extern int nd(void);

int lib_new(int *a, int n) {

   int i = 1;
   int maxv = a[0];
   int result;

   while((i < n)) {
      if(a[i] >= maxv) {
         maxv = a[i];
      }
      i++;
   }

   result = maxv;
   return result;
}


int client_new(int x){
    int a[1000];
    for (int i =0; i < 1000; i++){
        a[i] = i;
    }

    if (x <= 1000)
        return lib_new(&a, x);
    else
        return 0;
}


int lib_old(int *a, int n) {

   int i = 1;
   int max = 0;
   int result;

   while( (i < n)) {
      if(a[i] >= a[max]) {
         max = i;
      }
      i++;
   }

   result = a[max];
   return result;
}

int client_old(int x){
    int a[1000];
    for (int i =0; i < 1000; i++){
        a[i] = i;
    }
    if (x <= 1000)
        return lib_old(&a, x);
    else
        return 0;
}


int main(){

int x = nd();
sassert(client_new(x) == client_old(x));
}