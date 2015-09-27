#include <stdio.h>

int main()
{
	int x, y, ctr;
	int f1 = 1, f2 = 1, fib = 0;

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
		fib = f1 + f2;
		f2 = f1;
		f1 = fib;
		if (fib >= x && fib <= y)
		{
			printf("%d\n", fib);
		}
	}
	printf("\n");
	return 0;
}