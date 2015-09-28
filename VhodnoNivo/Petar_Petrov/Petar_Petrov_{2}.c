#include<stdio.h>

int SumOfNumDivBy17(int x, int y);

int main()
{
    int x,y;
    
    do
    {
        printf("Please input two whole numbers(x<y):\n");
        scanf("%d %d",&x,&y);
    } while(x>y);
    printf("%d\n",SumOfNumDivBy17(x,y));
    return 0;
}

int SumOfNumDivBy17(int x, int y)
{
    int sum = 0, interval_num, divider = 17;
    
    for(interval_num = x; interval_num <= y; interval_num++)
    {
        if(interval_num % divider == 0)
        {
            sum += interval_num;
        }
    }
    
    return sum;
}
