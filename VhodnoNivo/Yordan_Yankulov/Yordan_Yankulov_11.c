#include<stdio.h>

int main()
{
	float x, pi;
	do{
		scanf("%f", &x);
	}while((x <= 0) || (x >= 1));
	int helper = 0, right = 0;
	pi = 4 - (4/3);
	double n[100];
	n[0] = 3;
	
	if((4/3) < x )
	{
			right = 1;
			
	}
	while(right != 1)
	{
		helper ++;
		n[helper] = n[helper-1] + 2;
		if((4/n[helper]) < x )
		{
			right = 1;
		}
		
	}
	int help_1 = helper;
	for(helper = 1; helper <= help_1; helper++)
	{
	
		if(helper % 2 == 0)
		{
			pi = pi - (4/n[helper]);
		}else
		{
			pi = pi + (4/n[helper]);
		}
	}
	printf("%f\n", pi);
	return 0;
}		
