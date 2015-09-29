#include<stdio.h>

int PrimesEndingWith3(int);

int main()
{
    int x,y,interval_num;
    
    do
    {
        printf("Please input two whole numbers(x<y):\n");
        scanf("%d %d",&x,&y);
    } while(x>y);
    for(interval_num = x; interval_num <= y; interval_num++)
    {
        PrimesEndingWith3(interval_num);
    }
    return 0;
}

int PrimesEndingWith3(int interval_num)
{
    int divider = 2;
    if(interval_num > 1) 
    {
        while(interval_num % divider != 0)
        {
            divider++;
        }
    }
    if(interval_num == divider)
    {
        if(interval_num % 10 == 3)
        {
            printf("%d\n",interval_num);
        }
    }
    return 0;
}
