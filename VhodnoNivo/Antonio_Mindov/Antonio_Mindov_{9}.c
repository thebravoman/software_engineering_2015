#include <stdio.h>
#include <math.h>

int main()
{
	int arraySize = 10;
	int x;
	int i = 0;
	double arr[arraySize];	
	int count = 0;
	double curr;

	do
	{
		scanf("%d", &x);
	} while(x < 0 || x >= 10);

	while(count < arraySize)
	{
		curr = cos(i++);

		if(curr >= 0 && (int)(curr*1000) % 10 == x)
		{
			arr[count++] = curr;
		}		

	}

	for (i = 0; i < arraySize; i++)
	{
		printf("%d. %lf\n", i+1, arr[i]);
	}

	return 0;
}