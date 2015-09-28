#include<stdio.h>

void Array_Init(int*,int);

int main()
{
    int x;
    int array[10];
    do
    {
        printf("Please input a whole number between 0(including) and 10 to divide with:\n");
        scanf("%d",&x);
        if(x == 0)
        {
         printf("Error - 0 cannot be divided with!\n");
        }
    } while(x <= 0 || x >= 10);
    if(x == 0)
    {
        printf("Error - 0 cannot be divided with!\n");
    }
    Array_Init(array,x);
    
    return 0;
}

void Array_Init(int arr[10],int x)
{
    int fib_count, fib_res, fib_0, fib_1;
    
    for(fib_count = 0, fib_0 = 0, fib_1 = 1, fib_res = 0; fib_count < 10; )
    {
        fib_res = fib_1 + fib_0;
        fib_0 = fib_1;
        fib_1 = fib_res;
        if(fib_res % x == 0)
        {
            arr[fib_count] = fib_res;
            printf("%d\n",arr[fib_count]);
            fib_count++;
        }
    }
    
    return;
}
