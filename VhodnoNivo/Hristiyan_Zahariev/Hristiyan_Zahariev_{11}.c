#include <stdio.h>

int main()
{
	double x;
	double pi=4;
	double n=3;
	double res = 4-(4/n);
	int i=1;
	
	printf("Enter x! (0<x<1) \n");
	scanf("%lf", &x);

	while (x>=1 || x<=0)
	{
		printf("Enter x (0<x<1)\n");
		scanf("%lf", &x);
	}
	
	while (x<=4/n)
	{
		pi = res * (-1);
		n = n + 2;
	}
	
	if (pi<0) pi = pi * (-1);
	printf("Pi = %f", pi);
	return 0;
}
