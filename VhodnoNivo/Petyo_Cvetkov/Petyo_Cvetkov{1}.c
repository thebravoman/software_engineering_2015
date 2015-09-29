#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x = 0 , y = 0 , sum = 0;

    while(x >= y)
    {
        scanf("%d%d", &x, &y);
    }
    for(; x <= y; x++)
    {
        if(x % 2 != 0)
        {
            sum+=x;
        }

    }
    printf("%d", sum);
    return 0;
}
