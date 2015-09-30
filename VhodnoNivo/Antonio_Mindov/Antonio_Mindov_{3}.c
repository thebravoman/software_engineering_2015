#include <stdio.h>

int isPrime(int numb)
{
	int i;

	for (i = 2; i < numb/2 + 1; ++i)
	{
		if(numb % i == 0)
		{
			return 0;
		}
	}

	return 1;
}

int main()
{
	int x,y;
	int i;

	do
	{
		scanf("%d %d", &x, &y);
	} while(x > y);

	for (i = x; i <= y; i++)
	{
		if(isPrime(i) && i % 10 == 3)
		{
			printf("%d\n", i);
		}
	}

	return 0;
}