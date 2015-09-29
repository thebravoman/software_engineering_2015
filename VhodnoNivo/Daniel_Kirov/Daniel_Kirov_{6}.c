#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ARRAY_SIZE 100

int main()
{
    int x;
    int z;
    int c;
    int i;
    int array[ARRAY_SIZE];
    srand(time(NULL));

    do
    {
        printf("Input value of x: ");
        scanf("%d", &x);
    }
    while(x <= 0 || x >= 10);

    for( i = 0; i < ARRAY_SIZE; i++)
    {
        array[i] = rand() % 99 + 1;
    }

    for( i = 0; i < ARRAY_SIZE; i++)
    {
        if(array[i] % 10 == x)
        {
            for( c = 0; c % 10 != x; c++)
            {
                z = array[i];
                array[i] = array[c];
                array[c] = z;
            }
        }
    }

    printf("\n");

    for( i = 0; i < ARRAY_SIZE; i++)
    {
        printf("%d\n", array[i]);
    }


    return 0;
}
