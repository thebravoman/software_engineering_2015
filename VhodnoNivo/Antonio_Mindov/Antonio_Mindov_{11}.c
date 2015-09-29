#include <stdio.h>

int main()
{
	double x;
	double i = 3;
	double pi = 4;
	int sign = 0;
	double curr = 4/i;

	do
	{
		scanf("%lf", &x);
	} while(x <= 0 || x >=1);

	while(curr > x)
	{		
		if(sign)
		{
			pi += curr;
		}
		else
		{
			pi -= curr;
		}

		i += 2;
		sign = !sign;
		curr = 4/i;
	}

	printf("%lf", pi);

	return 0;
}