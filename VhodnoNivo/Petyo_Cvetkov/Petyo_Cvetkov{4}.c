#include <stdlib.h>

int main()
{
    int x = 0 , y = 0 , a = 1 , b = 1 , c = 0 ;


    while(x >= y)
    {
        scanf("%d%d", &x, &y);
    }
    while(b <= y)
    {
        if (b >= x && b<=y )
        {
            printf("%d\n", b);
        }
        c = a + b;
        a = b;
        b = c;

    }

    return 0;
}
