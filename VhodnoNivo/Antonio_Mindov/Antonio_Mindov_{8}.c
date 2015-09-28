#include <stdio.h>
#include <stdlib.h>

int main()
{
	int arraySize = 10;
	int x;
	int i;
	int arr[arraySize];
	int secondArr[arraySize];
	int count = 0;
	srand((unsigned) time(NULL));

	do
	{
		scanf("%d", &x);
	} while(x <= 0 || x >= 100);

	for (i = 0; i < arraySize; i++)
	{
		arr[i] = rand() % 150 + x;

		if(arr[i] % 2 != 0)
		{
			secondArr[count++] = arr[i];
		}
	}

	for (i = 0; i < count; i++)
	{
		printf("%d. %d\n", i+1, secondArr[i]);
	}

	return 0;
}