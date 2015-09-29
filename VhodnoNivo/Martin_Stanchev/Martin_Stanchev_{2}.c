#include <stdio.h>

int main() {
  int x,y;
  int sum = 0;
  printf("Enter x\n");
  scanf("%d", &x);
  printf("Enter y>x\n");
  scanf("%d", &y);
  
  while(x <= y) {
    if(x % 17 == 0)
      sum += x;
    x++;
  }
  printf("%d\n", sum);
  return 0;
}
