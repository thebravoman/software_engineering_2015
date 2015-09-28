#include <stdio.h>

int fibbonaci(int numb)
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
	int curr;

	do
	{
		scanf("%d", &x);
	} while(x <= 0 || x >= 10);

	while(count < 10)
	{
		curr = fibbonaci(i);
		
		if(endWithX(curr, x))
		{
			arr[count++] = i;
		}

		i++;
	}

	for (i = 0; i < count; ++i)
	{
		printf("%d. %d\n", i+1, arr[i]);
	}

	return 0;
}