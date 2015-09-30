#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define ARRAY_SIZE 10

int main()
{

    double array[ARRAY_SIZE];
    int x;
    int i;
    int j;
    double a;

    for( i = 0; i < ARRAY_SIZE; i++)
    {
        array[i] = cos(i);
        printf("%lf\n",array[i]);
    }

    for (i = 0; i < ARRAY_SIZE; i++)
    {
        for( j = i + 1; j < ARRAY_SIZE; j++)
        {
            if(array[i] < array[j])
            {
                a = array[i];
                array[i] = array[j];
                array[j] = a;
            }
        }
    }

    printf("\n");
    printf("\n");

    for(i = 0; i < 10; i++)
    {
        printf("%lf\n", array[i]);
    }

    return 0;
}
