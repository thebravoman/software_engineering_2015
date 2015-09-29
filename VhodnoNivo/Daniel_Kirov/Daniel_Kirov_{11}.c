#include <stdio.h>
#include <stdlib.h>

int main()
{
    double x;
    double pi = 4.0;
    double n = 3;

    do
    {
        printf("Input value of x: ");
        scanf("%lf", &x);
    }
    while(x <= 0 || x >= 1);

    while(4 / n >= x)
    {
        pi = pi - 4 / n;
        n += 2;

        if(4 / n < x)
        {
            break;
        }

        pi = pi + 4 / n;
        n += 2;
    }

    printf("%lf", pi);

    return 0;
}
