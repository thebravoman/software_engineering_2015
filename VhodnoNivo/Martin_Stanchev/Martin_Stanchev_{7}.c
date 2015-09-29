#include <stdio.h>
#include <stdlib.h>

int main() {
  int str[10], str2[5];
  int i, j, x;
  
  printf("Enter 0<X<100 \n");
  scanf("%d", &x);

  for(i = 0; i < 10; i++){
    str[i] = x + (rand() % 100);
    if(i % 2 == 0){
      str[j] = str[i];
      printf("%d ", str[j]);
    }
  }
  
}