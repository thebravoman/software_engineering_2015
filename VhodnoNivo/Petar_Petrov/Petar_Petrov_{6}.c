#include<stdio.h>
#include<stdlib.h>
#include<time.h>

void Array_Init(int *);

void Array_Sort(int *, int );

int main()
{
    int x,array[100],counter_1;
    
    do
    {
        printf("Please input a whole number between 0 and 10:\n");
        scanf("%d",&x);
    } while(x <= 0 || x >= 10);
    
    Array_Init(array);
    Array_Sort(array,x);
    return 0;
}

void Array_Init(int arr[100])
{
    int counter;
    
    srand(time(NULL));
    for(counter = 0; counter < 100; counter++)
    {
        arr[counter] = rand() % 100;
        printf("%d\n",arr[counter]);
    }
    
    return;
}

void Array_Sort(int arr[100], int x)
{
    int counter,counter_2,var;
    
    for(counter = 0; counter < 100; counter++)
    {
        if(arr[counter] % 10 == x)
        {
            for(counter_2 = 0; counter_2 < 100; counter_2++)
            {
                if(arr[counter_2] % 10 != x)
                {
                    var = arr[counter];
                    arr[counter] = arr[counter_2];
                    arr[counter_2] = var;
                    break;
                }
            }
        }
    }
    printf("LINE\n");
    for(counter = 0; counter < 100; counter++)
    {
        printf("%d\n",arr[counter]);
    }
    return;
}
