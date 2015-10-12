#include<stdio.h>
#include<stdlib.h>

int SumOfIntervalNum(int x, int y);

int main()
{
    int x,y;
       do
       { 
        printf("Please input two whole numbers(x<y):\n");
        scanf("%d %d",&x,&y);
       } while(x>y);
    printf("%d\n",SumOfIntervalNum(x,y));
    return 0;
}

int SumOfIntervalNum(int x, int y)
{
    int num_interval,divider = 2,sum_primes = 0;
    for(num_interval = x; num_interval <= y; num_interval++)
    {
      if(num_interval > 1)
      {  
        while(num_interval % divider != 0)
        {
            divider++;
        }
      }
        if(num_interval == divider)
        {
            sum_primes += num_interval;
        }
        divider = 2;
    }
    return sum_primes;
}
