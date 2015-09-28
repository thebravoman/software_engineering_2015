#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x = 0 , y = 0 , j , i ;


    while(x >= y)
    {
        scanf("%d%d", &x, &y);
    }
    for(; x <= y ; x++ )
    {
        for(i = 2; i < x; i++)
        {
            if ( x % i == 0)
            {
                j = 1;                 
                break;
            }else
            {
                j = 0;
            }
        }
        if(j == 0 && x % 10 == 3)
        {
            printf("%d\n", x);
        }


    }
    return 0;
}
