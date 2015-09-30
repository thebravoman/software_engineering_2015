#include <stdio.h>

int main ()

{
	int x,y;
	int sum = 0;
		
	printf("Input x:");
	scanf("%d", &x);
	printf("Input y:");
	scanf("%d", &y);
	
	if ( y <= x )
		{		
		  printf("Y has to be bigger than X:\n");
		  printf("Enter Y again: \n");
		  scanf("%d", &y);
		}
	int i;	
	for (i = x ; i <= y ; i++)
		{
		
			if (i % 2 != 0)
				{
					sum = sum + 1;
				}

		}	


	printf("The sum is:%d\n", sum);
	


return 0;
}
