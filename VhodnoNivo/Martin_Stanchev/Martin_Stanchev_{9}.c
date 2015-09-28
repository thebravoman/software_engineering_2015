#include <stdio.h>
#include <math.h>

int main(){
  double str[10];
  int x;
  int i = 0, j = 0;
  int ind = 0, ind2 = 0;
  
  printf("Enter 0<X>10\n");
  scanf("%d", &x);
  
  while(j < 10){
     ind = cos(i) * 1000;
     
     if(ind < 0){
       ind *= (-1);
    }
    if(ind % 10 == x){
      str[j] = cos(i);
      j++;
    }
    i++;
  }
  for(i = 0; i < 10; i++){
    printf("%f ",str[i]);
  }
}
