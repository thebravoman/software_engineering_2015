#include <stdio.h>
#include <stdlib.h>
#define ARRAY_SIZE 10
#define ARR_SIZE 5

int main()
{
    int x;
    int i;
    int j;
    int array[ARRAY_SIZE];
    int arr[ARR_SIZE];

    do
    {
        printf("Input value of x: ");
        scanf("%d", &x);
    }
    while(x<=0 || x>=100);

    for( i = 0; i < ARRAY_SIZE; i++)
    {
        do
        {
            printf("Input number in cell %d, higher than %d : ", i, x);
            scanf("%d", &array[i]);
        }
        while(array[i] <= x);
    }

    printf("\n");

    for( i = 0; i < ARR_SIZE; i++)
    {
      arr[i] = array[i*2];

      printf("Value in cell number %d is: %d\n", i, arr[i]);
    }

    return 0;
}
