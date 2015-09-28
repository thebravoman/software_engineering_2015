#include <stdio.h>

int main() {
  int x,y, fib1 = 0, fib2 = 1, fib3;
  int sum = 0;
  printf("Enter x\n");
  scanf("%d", &x);
  printf("Enter y>x\n");
  scanf("%d", &y);
  
  while(fib1 < y+1) {
    if(fib1 > x-1)
      printf("%d ", fib1);
    fib3 = fib1 + fib2;
    fib1 = fib2;
    fib2 = fib3;
  }
  return 0;
}
