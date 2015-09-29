#include <stdio.h>

long long int fibbonaci()
{
	// if(numb <= 2)
	// {
	// 	return 1;
	// }
	// else
	// {
	// 	return fibbonaci(numb - 1) + fibbonaci(numb - 2);
	// }

	static long long int last1 = 0, last2 = 0;

	long long int temp = last1 + last2;

	if(temp == 0)
	{
		temp = 1;
	}

	last1 = last2;
	last2 = temp;

	return temp;

}

int endWithX(long long int numb, int x)
{
	return numb % 10 == x;
}

int main()
{
	int arraySize = 10;
	int x;
	int i = 0;
	int count = 0;
	long long int arr[arraySize];
	long long int curr;

	do
	{
		scanf("%d", &x);
	} while(x <= 0 || x >= 10);

	while(count < 10)
	{
		curr = fibbonaci();		
		
		if(endWithX(curr, x))
		{
			arr[count++] = curr;
		}

		i++;
	}

	for (i = 0; i < count; ++i)
	{
		printf("%d. %lld\n", i+1, arr[i]);
	}

	return 0;
}