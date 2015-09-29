#include <stdio.h>

int main()
{
	int x,y;
	int i;
	int sum = 0;

	do
	{
		scanf("%d %d", &x, &y);
	} while(x > y);

	for (i = x; i <= y; i++)
	{
		if(i % 17 == 0)
		{
			sum += i;
		}
	}

	printf("Sum is : %d", sum);

	return 0;
}