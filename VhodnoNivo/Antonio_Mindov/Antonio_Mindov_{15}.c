#include <stdio.h>

int findSumByDivisor(int divisor)
{
	int sum = 0;

	int i;
	
	for (i = 0; i < 1000; ++i)
	{
		if(i % divisor == 0)
		{
			sum += i;
		}
	}

	return sum;
}

int main()
{
	int arraySize = 10;
	int x;
	int i;
	int arr[arraySize];

	do
	{
		scanf("%d", &x);
	} while(x <= 0 || x >= 10);
	
	for (i = 0; i < arraySize; ++i)
	{
		arr[i] = findSumByDivisor(x * (i + 1));
		printf("%d. %d\n", i+1, arr[i]);
	}

	return 0;
}