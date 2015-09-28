#include <stdio.h>

int main()
{
    int i;
    int first = 0;
    int second = 0;
    int next = 1;
    int x;
    int y;

    printf("Input value of y: ");
    scanf("%d", &y);
    printf("Input value of x: ");
    scanf("%d", &x);

    while(x >= y)
    {
        printf("Input a lower value of x: ");
        scanf("%d", &x);
    }

    for( i = 1; i <= y; i++)
    {
            if(i >= x)
            {
               printf("%d\n",next);
            }

            first = second;
            second = next;
            next = first + second;
    }

    return 0;
}
