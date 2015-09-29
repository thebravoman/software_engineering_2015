#include <stdio.h>
#include <stdlib.h>

int main()
{
	int arraySize = 10;
	int x;
	int i;
	int arr[arraySize];
	int secondArr[arraySize/2];
	srand((unsigned) time(NULL));

	do
	{
		scanf("%d", &x);
	} while(x <= 0 || x >= 100);

	for (i = 0; i < arraySize; i++)
	{
		arr[i] = rand() % 150 + x;

		if(i % 2 == 0)
		{
			secondArr[i/2] = arr[i];
		}
	}

	for (i = 0; i < arraySize/2; i++)
	{
		printf("%d. %d\n", i+1, secondArr[i]);
	}

	return 0;
}