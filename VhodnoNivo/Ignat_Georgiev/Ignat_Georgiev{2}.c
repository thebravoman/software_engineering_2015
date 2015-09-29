#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x = 0;
    int y = 0;
    int sum = 0;
    int i;
    printf("Input 2 integer numbers:\n");
    scanf("%d",&x);
    scanf("%d",&y);

    for(i=x;i<=y;i++)
    {
        if (i%17==0)
        {
            sum+=i;
        }
    }
    printf("%d",sum);
    return 0;
}
