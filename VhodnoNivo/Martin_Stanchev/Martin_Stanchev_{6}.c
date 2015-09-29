#include <stdio.h>
#include <stdlib.h>

int main() {
  int x,i,j = 0,m;
  int str[100];
  int srt_str[100];
  printf("Enter 0<X>10\n");
  scanf("%d", &x);
  
  for(i = 0; i <= 100; i++) {
    str[i] = rand() % 100;
    if(str[i] % 10 == x) {
      m = str[j];
      str[j] = str[i];
      str[i] = m;
      j++;
    }
  }
  
  for(j = 0; j <= 100; j++) printf("%d ", str[j]);
  return 0;
}