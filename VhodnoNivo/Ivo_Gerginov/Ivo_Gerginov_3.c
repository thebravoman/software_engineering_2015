#include <stdio.h>

int main()
{
	int x = 0;
	int y = 0;
	int ctr = 0;

	printf("Enter X:\n");
	scanf("%d", &x);
	while(y < x)
	{	
		printf("Enter Y(must be greater than X)\n");
		scanf("%d", &y);
		if (y < x)
		{
			printf("Y must be greater than X!!!");
		}
	}
	for (ctr = x; ctr <= y; ctr++)
	{
		if ( ctr % 10 == 3)
		{
			printf("%d ", ctr);
		}
	}
	printf("\n");
	return 0;
}