#include <stdio.h>

int main(){

  int num = 160;
  printf("Enter number:");
  scanf("%d", &num);
  int i;
  printf("Dels:\n");
  for(i = 2; i < num; i++){
    if(num % i == 0){
      printf("%d ",i);
    }
  }

  return 0;
}
