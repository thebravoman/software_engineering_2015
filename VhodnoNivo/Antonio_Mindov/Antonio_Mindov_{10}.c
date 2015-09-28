#include <stdio.h>

long long int fibbonaci(int numb)
{
	if(numb <= 2)
	{
		return 1;
	}
	else
	{
		return fibbonaci(numb - 1) + fibbonaci(numb - 2);
	}
}

int main()
{
	int arraySize = 10;
	int x;
	int i = 0;
	long long int arr[arraySize];	
	int count = 0;
	int curr;

	do
	{
		scanf("%d", &x);
	} while(x < 0 || x >= 10);

	while(count < arraySize)
	{
		curr = fibbonaci(i++);

		if(curr % x == 0)
		{
			arr[count++] = curr;
		}		

	}

	for (i = 0; i < arraySize; i++)
	{
		printf("%d. %lld\n", i+1, arr[i]);
	}

	return 0;
}