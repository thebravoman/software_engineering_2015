#include <stdio.h>

int main(){
  int x;
  int y;
  int sum=0;
  int br=0;
    printf("Vuvedi celochisleni chisla");
    scanf("%d%d", &x, &y);
    if (x<y){
      for(br=x;br<=y;br++){
        if(br %17 == 0){
          sum=sum+br;
        }
      }
    }
    printf("Sumata na delqshtite se na 17 e:%d", sum);
  return 0;
}
