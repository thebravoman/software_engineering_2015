#include <stdio.h>
#include <stdlib.h>

void bubleSortAlternate(int arr[], int size, int x)
{	
	int changed;
	int i = 0, b;
	do
	{
		changed = 0;
		for (b = 0; b < (size - i) - 1; ++b)
		{
			if(arr[b+1] % 10 == x)
			{
				int tmp = arr[b];
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
	int arraySize = 100;
	int x;
	int i;
	int arr[arraySize];
	srand((unsigned) time(NULL));

	do
	{
		scanf("%d", &x);
	} while(x <= 0 || x >= 10);

	for (i = 0; i < arraySize; i++)
	{
		arr[i] = rand() % 100;		
	}

	bubleSortAlternate(arr, arraySize, x);
	printf("\nSorted : \n ");

	for (i = 0; i < arraySize; i++)
	{
		printf("%d. %d\n", i+1, arr[i]);
	}

	return 0;
}