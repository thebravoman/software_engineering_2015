#include <stdio.h>

int main(){
    int x,y,sum=0,count=0;
    printf("Vuvedi chisla");
    scanf("%d%d", &x, &y);
    if(y<=x){printf("Invalid numbers");}
    else{
    for(count=x;count<=y;count++){
        if(count%17 == 0){sum=sum+count;}
    }
    printf("Sumata e:%d", sum);};
    return 0;
}
