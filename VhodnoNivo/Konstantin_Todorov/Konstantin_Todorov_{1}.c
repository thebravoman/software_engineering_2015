#include <stdio.h>

int main(){
    int x,y,sum=0,count=0;
    printf("Vuvedi chisla");
    scanf("%d%d", &x, &y);
    for(count=x;count<=y;count++){
        if(count%2 != 0){sum=sum+count;}
    }
    printf("Sumata e:%d", sum);
    return 0;
}
