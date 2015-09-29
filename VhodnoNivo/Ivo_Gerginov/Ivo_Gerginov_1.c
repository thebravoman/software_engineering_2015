#include <stdio.h>

int main()
{
	int x, y, ctr;
	int sum = 0;

	printf("Enter X:\n");
	scanf("%d", &x);
	while (y < x)
	{
		printf("Enter Y (must be more than X):\n");
		scanf("%d", &y);
		if ( y < x)
			printf("Y must be more than X!!!/n");
	}

	for (ctr = x; ctr <= y; ++ctr)
	{
		if (ctr % 2 != 0)
		{
			sum += ctr;
		}
	}

	printf("Sum of odds is: %d\n", sum);
	return 0;
}
