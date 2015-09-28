#include <stdio.h>
#include <stdlib.h>
#define ARRAY_SIZE 10

int Fib(int n)
{
    if(n <= 2)
    {
        return 1;
    }
    return Fib(n-1) + Fib(n-2);
}

int main()
{
    int x;
    int array[ARRAY_SIZE];
    int i = 0;
    int c = 1;
    int curr = 0;

    do
    {
        printf("Input value of x: ");
        scanf("%d", &x);
    }
    while(x < 0 || x >= 10);

    while(i < ARRAY_SIZE)
    {
        curr = Fib(c);

        if(curr % x == 0)
        {
            array[i] = curr;
            printf("%d\n", array[i]);
            i++;
        }
        c++;
    }

    return 0;
}
