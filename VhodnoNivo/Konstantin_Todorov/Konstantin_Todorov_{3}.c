
#include <stdio.h>

int main()
{
    int x, y, count1, count2, IS_Prime;

    printf("Vuvdei chisla");

    scanf("%d%d", &x, &y);

    for(count1=x;count1<=y;count1++){

        for(count2=2;count2<=count1;count2++){
            if(count1%count2 == 0 ){break;}
            else{IS_Prime=0;}
        }
        if(IS_Prime==0 && count1%10==3){
            printf("\n4isloto %d e prosto i zavur6va na 3 ", count1);
        }
    }

    return 0;
}
