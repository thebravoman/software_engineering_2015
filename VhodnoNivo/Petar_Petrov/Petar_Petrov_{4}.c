#include<stdio.h>

int FindFibNum(int interval_num);

int main()
{
    int x,y,interval_num;
    
    do
    {
        printf("Please input two whole numbers(x<y):\n");
        scanf("%d %d",&x,&y);
    } while(x>y || x < 0 || y < 0);
    
    for(interval_num = x; interval_num <= y; interval_num++)
    {
        FindFibNum(interval_num);
    }
    return 0;
}

int FindFibNum(int interval_num)
{
    int fib_res = 0,fib_0 = 0,fib_1 = 1;
    
    while(fib_res < interval_num)
    {
        fib_res = fib_1 + fib_0;
        fib_0 = fib_1;
        fib_1 = fib_res;
    }
    if(fib_res == interval_num)
    {
        printf("%d\n",interval_num);
    }
    return 0;
}
