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

int endWithX(int numb, int x)
{
	return numb % 10 == x;
}

int main()
{
	int arraySize = 10;
	int x;
	int i = 0;
	int count = 0;
	int arr[arraySize];

	do
	{
		scanf("%d", &x);
	} while(x <= 0 || x >= 10);
	
	if(x % 2 != 0 && x != 5)
	{
		while(count < 10)
		{
			if(isPrime(i) && endWithX(i, x))
			{
				arr[count++] = i;
			}

			i++;
		}
	}

	for (i = 0; i < count; ++i)
	{
		printf("%d. %d\n", i+1, arr[i]);
	}

	return 0;
}

