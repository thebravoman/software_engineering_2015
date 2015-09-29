#include <stdio.h>
#include <math.h>

double getCosSum(int from, int to)
{
	double sum = 0;

	int i;
	
	for (i = from; i < to; ++i)
	{
		sum += cos(i);
	}

	return sum;
}


int main()
{
	int arraySize = 10;
	int x;
	int i;
	double arr[arraySize];

	do
	{
		scanf("%d", &x);
	} while(x <= 0 || x >= 10);
	
	for (i = 0; i < arraySize; ++i)
	{
		arr[i] = getCosSum(i * x, (i + 1) * x);
		printf("%d. %lf\n", i+1, arr[i]);
	}

	return 0;
}