#include <stdio.h>

int main()
{
	int x=0;
	int y=1;
	int i;
	int sum=0;
	printf("Enter the first number ( must be smaller than the second number):\n ");
	scanf("%d",x);
	printf("Enter the second number:\n");
	scanf("%d",y);
	if (x>y)
	{
	}
	else
	{
		for (i=x;i<=y;i++)
		{
			if (i%2!=0)
			{
				sum+=i;
			}
		}
	printf("The sum of all odd numbers is: %d\n",sum);
	}
	return 0;
}
