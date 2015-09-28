#include <stdio.h>
#include <stdlib.h>
#include<time.h>

int main()
{
    int x = 0  , arr[100] ,i , c = 0 , d = 0 ;
    time_t t;


        scanf("%d", &x);


        for(i = 0; i <= 100; i++)
	{


		arr[i] = rand() % 100;
		printf("%d\n",arr[i]);
	}
	for(i = 0 ; i <100 ; i++)
    {
        if (x >= 10)
            {

        if(arr[i] % 100 == x)
        {
            c = arr[i];
            arr[i] = arr[d];
            arr[d] = c;
            d++;
        }


            }else
            {
                if(arr[i] % 10 == x)
        {
            c = arr[i];
            arr[i] = arr[d];
            arr[d] = c;
            d++;
        }
            }
    }

    return 0;
}
