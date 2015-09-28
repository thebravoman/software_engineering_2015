#include<stdio.h>

void FirstArrInit(int*,int);
void SecondArrInit(int*,int*);

int main()
{
    int x;
    int array_1[10],array_2[10];
    do
    {
        printf("Please input a whole number between 0 and 100:\n");
        scanf("%d",&x);
    } while(x <= 0 || x >= 100);
    FirstArrInit(array_1,x);
    SecondArrInit(array_1,array_2);

    return 0;
}

void FirstArrInit(int arr[10], int x)
{
    int arr_count;
    
    for(arr_count = 0; arr_count < 10; arr_count++)
    {
        do
        {
            printf("Please input array element %d greater than x:\n",arr_count);
            scanf("%d",&arr[arr_count]);
        } while(arr[arr_count] <= x);
        printf("%d\n",arr[arr_count]);
    }
    return;
}

void SecondArrInit(int arr_1[10], int arr_2[10])
{
    int arr_1_counter,arr_2_counter;
    printf("\n");
    for(arr_1_counter = 0,arr_2_counter = 0;arr_1_counter < 10; arr_1_counter++)
    {
        if(arr_1[arr_1_counter] % 2 != 0)
        {
            arr_2[arr_2_counter] = arr_1[arr_1_counter];
            printf("%d\n",arr_2[arr_2_counter]);
            arr_2_counter++;
        }
    }
    
    return;
}
