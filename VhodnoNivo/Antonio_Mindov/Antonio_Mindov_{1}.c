#include <stdio.h>

int main()
{
	int x,y;
	int startValue;
	int i;
	int sum = 0;

	do
	{
		scanf("%d %d", &x, &y);
	} while(x > y);	

	if(x % 2 == 0)
	{
		startValue = x+1;
	}
	else
	{
		startValue = x;
	}	

	for (i = startValue; i <= y; i+=2)
	{
		sum += i;
	}

	printf("Sum is : %d", sum);

	return 0;
}