#include <stdio.h>
#include <stdlib.h>

int main(){
  int x = 0;
  int y = 0; 
  int j; 
  int i;//boq4 sled 1
    printf("Vuvedi chisla:");
    scanf("%d%d", &x, &y);
    for(x=x;x<=y;x++){
      for(i=2;i<x;i++){
        if (x%i == 0){
          j=1;//proverka za delitelite                 
          break;
        }else{
          j=0;
        }
      }
      if(j==0 && x%10==3){
        printf("Chisla delqshti se na 3 i sa prosti sa: %d\n", x);
      }
   }
return 0;
}
