#include <stdio.h>

int main() {
  int x,y;
  int sum = 0;
  printf("Enter x\n");
  scanf("%d", &x);
  printf("Enter y>x\n");
  scanf("%d", &y);
  
  while(x <= y) {
    if(x % 2 == 1)
      sum += x;
    x++;
  }
  printf("%d\n", sum);
  return 0;
}
