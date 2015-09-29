#include <stdio.h>
#include <math.h>

void bubleSortDouble(double arr[], int size) 
{	
	int changed;
	int i = 0, b;
	do
	{
		changed = 0;
		for (b = 0; b < (size - i) - 1; ++b)
		{
			if(arr[b] < arr[b+1])
			{
				double tmp = arr[b];
				arr[b] = arr[b+1];
				arr[b+1] = tmp;
				changed = 1;
			}
		}

		i++;
	} while (changed);
}

int main()
{
	int arraySize = 10;
	int x;
	int i;
	double cosinuses[arraySize];

	do
	{
		scanf("%d", &x);
	} while(x <= 0 || x >= 10);

	for (i = 0; i < arraySize; i++)
	{
		cosinuses[i] = cos(i);
		printf("%d. %lf\n", i, cosinuses[i]);
	}

	bubleSortDouble(cosinuses, arraySize);
	printf("\nSorted : \n ");

	for (i = 0; i < arraySize; i++)
	{
		printf("%d. %lf\n", i+1, cosinuses[i]);
	}

	return 0;
}