#include <stdio.h>
#include <stdlib.h>
#include<math.h>
int main()
{
    int x = 0  , i , c , d ;
    float arr[10] , swap ;

    while(x< 0 && x > 10)
    {
        scanf("%d", &x);
    }
   for(i = 0 ; i < 10 ; i++)
   {
       arr[i] = cos(i);
       printf("%f  ", arr[i]);
   }
    for (c = 0 ; c <  10 - 1 ; c++)
  {
    for (d = 0 ; d < 10  - c - 1; d++)
    {
      if (arr[d] > arr[d+1])
      {
        swap       = arr[d];
        arr[d]   = arr[d+1];
        arr[d+1] = swap;
      }
    }

  }
  printf("\n");
  for(i = 0 ; i < 10 ; i++)
   {

       printf("%f  ", arr[i]);
   }
    return 0;
}
