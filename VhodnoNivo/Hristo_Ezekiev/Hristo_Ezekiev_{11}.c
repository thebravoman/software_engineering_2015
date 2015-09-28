#include <stdio.h>

int main()
{
	double x;
	double num = 3;
	double pi = 4;
	
	do{
	printf("Please enter X:");
	scanf("%lf",&x);	
	}while(x<0 || x>100);
	
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
