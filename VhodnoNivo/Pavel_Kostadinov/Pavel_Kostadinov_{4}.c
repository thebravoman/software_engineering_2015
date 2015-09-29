#include <stdio.h>



int main()
{
	int x;
	int y;
	int i;
	int fib = 1;
	int fib1 = 0;
	int fib2 = 0;
	
	
	printf("x:");
	scanf("%d", &x);
	printf("y:");
	scanf("%d", &y);
	
	if(x >= y)
	{
		printf("Enter a new X\n");
		scanf("%d", &x);
	}
	
	for ( i = 1; i <= y; i++)
	{
		
	 	if(i >= x)
	 	{
	 		printf("%d\n", fib);
	 	}
	 	
		fib1 = fib2;
		fib2 = fib;
		fib = fib1 + fib2;
		
		
	
	 	
	}
	
	

return 0;
}
