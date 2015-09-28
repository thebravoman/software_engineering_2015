#include <stdio.h>

int min(int num1, int num2)
{
	if(num1 < num2)
	{
		return num1;
	}
	
	return num2;
}


int main()
{
	int arraySize = 10;
	int x, y, w, h;
	int i = 0;
	int arr[arraySize];	

	do
	{
		scanf("%d %d %d %d", &x, &y, &w, &h);
	} while(x <= 0 || y <= 0 || w <= 0 || h <= 0);

	printf("%d\n", (x/w) * (y/h));

	for (i = 0; i < min(x/w - 1, arraySize); i++)
	{
		arr[i] = w * (i+1);
		printf("%d. %d\n", i+1, arr[i]);
	}

	return 0;
}