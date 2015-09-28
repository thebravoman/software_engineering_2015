#include <stdio.h>

long long int fib( int num)
{

	if (num > 1)
	{
		return fib(num - 1) + fib(num - 2);
	} else if( num == 1)
	{
		return 1;
	} else 
	{
		return 0;
	}
}


int main()
{
	int x;
	long long int array[10];
	int num = 1;
	int i = 0;
	long long int current;
	
	printf("Enter a value for x\n");
	scanf("%d", &x);
	
	while (x <= 0 || x >10)
	{
		printf("enter a valid value for x (0<=x<10):\n");
		scanf("%d", &x);
	}
	
	printf("\n");
	
	while(i < 10)
	{
		current = fib(num);
		
		if(current % x == 0)
		{
			array[i] = current;
			printf("%lld\n", array[i]);
			i++;
		}
		
		num++;
	}
	


return 0;
}
