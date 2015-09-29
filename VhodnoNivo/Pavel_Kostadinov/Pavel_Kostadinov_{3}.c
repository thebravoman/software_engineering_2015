#include <stdio.h>

int primeNumbers( int n)
{	
	int i;
	
	if(n<2)
	{
		return 0;
	}
	
	for( i = 2; i < n; i++)
		{
			if(n % i == 0)
				{
					return 0;
				} 
		}
		return 1;
}

int main()
{
	int x;
	int y;
	int i;
	int sum = 0;
	

	printf("x:\n");
	scanf("%d", &x);
	printf("y:\n");
	scanf("%d", &y);
	if(x >= y)
	{
		printf("Enter a new X\n");
		scanf("%d", &x);
	}

	for(i = x; i <= y; i++)
		{
			if(primeNumbers(i) && i % 10 == 3) 
			{
				sum = sum + i;
			}
		}
	
	printf("%d", sum);





return 0;
}
