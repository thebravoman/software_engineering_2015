#include <stdio.h>

int main()
{
	double x;
	double num = 3;
	double pi = 4;
	
	printf("enter a value for x:\n");
	scanf("%lf", &x);
	
	while(x <= 0 || x >= 1)
	{
		printf("enter a valid value for x (0<x<1)\n");
		scanf("%lf", &x);
	}
	
	while(4 / num >= x)
	{
		pi = (pi -4 / num) * (-1) ;
		num += 2;
		
	}
	
	if(pi < 0)
	{
		pi *= (-1);	
	} 
	printf("Pi: %lf\n", pi);
		



	return 0;
}
