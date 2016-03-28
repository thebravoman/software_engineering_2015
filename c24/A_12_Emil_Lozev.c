#include <stdio.h>
#include "stdlib.h"

int* for_loop(int num){
  int *arr = (int *)malloc(100 * sizeof(int));
  int dels_count = 0, i;
  for(i = 2; i <= num; i++){
    if(num % i == 0){
      printf("%d ",i);
      arr[dels_count] = i;
      dels_count++;
    }
  }

  return arr;
}


int main(){
  int num = 160;
  printf("Enter number:");
  scanf("%d", &num);
  int i;

  printf("Dels:\n");
  int *arr = (int *)malloc(100 *sizeof(int));
  arr = for_loop(num);

  int fi = 0, arr_len = 0;
  i = 0;
  while(i < sizeof(arr)){
    if(!i == arr[arr_len]){
      fi = i;
      break;
    }else{
      arr_len++;
    }
  }

  printf("FI: %d\n",fi);
  return 0;
}
