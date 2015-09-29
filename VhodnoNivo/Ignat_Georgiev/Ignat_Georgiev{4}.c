#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x = 0;
    int y = 0;
    int i = 0;
    int j = 0;
    int k =1;
    int l;
    printf("Please input 2 integer numbers (first<second)\n");
    scanf("%d",&x);
    scanf("%d",&y);
    for (i=x;i<=y;i++)
    {

        if (i<=1)
        {
            l=i;
        }
        printf("%d\n",l);
        l=k+j;
        j=k;
        k=l;

    }
    return 0;
}
