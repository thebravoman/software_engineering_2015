#include <stdio.h>

int sumTo(int numb)
{
	if(numb <= 0)
	{
		return 0;
	}

	return sumTo(numb-1) + numb;
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
	
	while(count < 10)
	{
		if(i % x == 0)
		{
			arr[count++] = sumTo(i);
		}

		i++;
	}
	
	for (i = 0; i < arraySize; ++i)
	{
		printf("%d. %d\n", i+1, arr[i]);
	}

	return 0;
}