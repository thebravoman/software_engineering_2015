#include <stdio.h>

int main() {
  int x, i, n, j = 0, sum = 0;
  int str[10];
  
  printf("Enter x\n");
  scanf("%d", &x);
    
   for(n = 1; n <= x; n++){
      if(x % n == 0) {
	sum = 0;
	
	for (i = 0; i <= n; i++) {
	  sum += i;
	}
	
	str[j] = sum;
	j++;
      }
    
    }

  for (i = 0; i < j; i++){
    printf("%d ", str[i]);
  }
  return 0;
}