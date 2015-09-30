#include <stdio.h>

int main() {
  int x, i = 0, j = 0;
  int str[10];
  
  printf("Enter x\n");
  scanf("%d", &x);
  
  for(i = 1;i <= x+1; i++) {
    if(x % i == 0) {
      if(x % 2 != 0){
	str[j] = i;
	printf("%d ", str[j]);
	j++;
      }
    }
  }
  return 0;
}