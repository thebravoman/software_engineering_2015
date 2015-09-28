#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x;
    int y;
    int i;
    int res = 0;

    printf("Input value of y\n");
    scanf("%d", &y);
    printf("Input value of x\n");
    scanf("%d", &x);

    while(x >= y)
    {
        printf("Input a lower value of x\n");
        scanf("%d", &x);
    }

    for(i = x; i <= y; i++)
    {
        if((i % 17) == 0)
        {
            res = res + i;
        }
    }

    printf("%d",res);

    return 0;
}
