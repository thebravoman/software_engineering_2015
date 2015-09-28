#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define ARRAY_SIZE 10

int main()
{
   double array[ARRAY_SIZE];
   int x;
   int i = 0;
   int c = 0;
   double b;

   do
   {
       printf("Input a value of x where 0 <= x < 10: ");
       scanf("%d", &x);
   }
    while(x < 0 || x >= 10);

    while(c < ARRAY_SIZE)
    {
        b = cos(i);

        if( b >= 0 && (int)(b * 1000) % 10 == x)
        {
            array[c] = b;
            printf("%d: %lf\n", c,array[c]);
            c++;
        }

        i++;
    }




    return 0;
}
