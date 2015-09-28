#include <stdio.h>
	
int main()
{
	int x,y;
	int sum=0;
	
	printf("Input value of X:\n");
	scanf("%d", &x);
	printf("Input value of y:\n");
	scanf("%d", &y);
	
	if ( y <= x)
		{
		  printf("Y has to be bigger than X !!\n");
		  printf("Enter a new value of Y:\n");
		  scanf("%d", &y);
		}
	int i;	
	for (i = x ; i <= y ; i++)
		{
			if(i % 17 == 0)

			{
				sum = sum +1;
			}
		}

	printf("The sum is :%d\n",sum);

return 0;
}
