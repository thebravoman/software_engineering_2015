#include <stdio.h>

int main() {
 int x,i = 0, fib1 = 0, fib2 = 1, fib3; 
 int str[10];
 
 printf("Enter x \n");
 scanf("%d", &x);
 
 while(i < 10) {
    if(fib1 > x-1)
      if(fib1 % x == 0) {
	str[i] = fib1;
	i++;
      }
    fib3 = fib1 + fib2;
    fib1 = fib2;
    fib2 = fib3;
  }
  for(i = 0; i < 10; i++){
    printf("%d ",str[i]);
  }
}