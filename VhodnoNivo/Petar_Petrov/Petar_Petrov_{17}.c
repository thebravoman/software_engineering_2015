#include<stdio.h>

void FibEndingWithX(unsigned long int*,int);

int main()
{
    int x;
    unsigned long int array[10];
    
    do
    {
        printf("Please input a whole number between 0 and 10\n");
        scanf("%d",&x);
    } while(x <= 0 || x >= 10);
    FibEndingWithX(array,x);
    
    
    return 0;
}

void FibEndingWithX(unsigned long int arr[10],int x)
{
     unsigned long int fib_res, fib_0, fib_1, arr_count;
    
    for(arr_count = 0, fib_res = 0, fib_0 = 0, fib_1 = 1; arr_count < 10; arr_count++)
    {
        do
        {
            fib_res = fib_1 + fib_0;
            fib_0 = fib_1;
            fib_1 = fib_res;
        } while(fib_res % 10 != x);
        arr[arr_count] = fib_res;
        printf("%lu\n",arr[arr_count]);
    }

    return;
}
