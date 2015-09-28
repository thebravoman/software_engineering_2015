#include<stdio.h>

void SumOfXdivider(int*,int);

int main()
{
    int x;
    int array[10];
    
    do
    {
        printf("Please input a whole number between 0 and 10:\n");
        scanf("%d",&x);
    } while(x <= 0 || x >= 10);
    
    SumOfXdivider(array,x);
    
    return 0;
}

void SumOfXdivider(int arr[10], int x)
{
    int num_count, arr_count, interval_sum;
    
    for(arr_count = 1; arr_count <= 10; arr_count++)
    {
        for(num_count = 0, interval_sum = 0; num_count < 1000; num_count++)
        {
            if(num_count % (arr_count*x) == 0)
            {
                interval_sum += num_count;
            }
        }
        arr[arr_count-1] = interval_sum;
        printf("%d\n",arr[arr_count-1]);
    } 
     
    return;
}
