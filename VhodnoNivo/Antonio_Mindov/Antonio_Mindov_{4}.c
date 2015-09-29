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

int main()
{
	int x,y;
	int i;

	do
	{
		scanf("%d %d", &x, &y);
	} while(x > y);

	for (i = x; i <= y; i++)
	{
		printf("%d\n", fibbonaci(i));
	}

	return 0;
}