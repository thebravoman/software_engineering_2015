#include <stdio.h>
#include <stdlib.h>

int is_prime(int a)
{
    int i;

    if(a < 2)
    {
        return 0;
    }

    for(i = 2; i < a; i++)
    {
        if(a % i ==0)
        {
            return 0;
        }

    }

    return 1;
}

int main()
{
    int x;
    int y;
    int i;
    int res = 0;

    printf("Input value of y > 2\n");
    scanf("%d", &y);
    printf("Input value of x\n");
    scanf("%d", &x);

    while( y < 2)
    {
        printf("Input a higher value of y\n");
        scanf("%d", &x);
    }

    while( x >= y)
    {
        printf("Input a lower value of x\n");
        scanf("%d", &x);
    }

    for(i = x; i <= y; i++)
    {
        if(is_prime(i) && i % 10 == 3)
        {
            printf("%d\n",i);
        }
    }




    return 0;
}
