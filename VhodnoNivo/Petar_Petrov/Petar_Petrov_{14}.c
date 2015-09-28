#include<stdio.h>

void IntervalSum(int*,int);

int main()
{
    int x;
    int array[10];
    
    do
    {
        printf("Please input a whole number between 0 and 10:\n");
        scanf("%d",&x);
    } while(x <= 0 || x >= 10);        
    
    IntervalSum(array,x);
    
    return 0;
}

void IntervalSum(int arr[10], int x)
{
    int arr_count, num_count, interval_count, interval_sum;
    for(arr_count = 0, num_count = 0; arr_count < 10; arr_count++, num_count++)
    {
        while(num_count % x != 0)
        {
            num_count++;
        }
        for(interval_count = 0, interval_sum = 0; interval_count <= num_count; interval_count++)
        {
            interval_sum += interval_count;
        }
        arr[arr_count] = interval_sum;
        printf("%d\n",arr[arr_count]);
    }

    return;
}
