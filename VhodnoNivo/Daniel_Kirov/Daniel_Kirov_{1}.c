#include <stdio.h>

int main()
{
    int x;
    int y;
    int i;
    int res = 0;

    printf("Input value of y: \n");
    scanf("%d", &y);
    printf("Input value of x: \n");
    scanf("%d", &x);

    while(x >= y)
    {
        printf("Retardo.. input a lower value of x: \n");
        scanf("%d", &x);
    }

    for(i = x; i <= y; i++)
    {
        if(!(i % 2 == 0))
        {
            res = res + i;
        }
    }

    printf("The sum of all odd number from x to y is: %d \n", res);

    return 0;
}
