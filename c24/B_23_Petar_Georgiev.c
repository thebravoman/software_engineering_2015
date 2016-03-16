#include <stdio.h>
#include<math.h>


int
gcd_iter(int u, int v) {
  int t;
  while (v) {
    t = u; 
    u = v; 
    v = t % v;
  }
  return u < 0 ? -u : u; /* abs(u) */
}

int main(){
 

int i,n;
scanf ("%d%d", &i, &n);

printf("%d \n",gcd_iter(i,n));

return 0;
}
