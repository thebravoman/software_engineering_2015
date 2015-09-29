#include <stdio.h>
#include <stdbool.h>
int main()
{
	double x;
	double i = 3;
	double pie = 4;
	bool flag = 0;
	double n = 4/i;
	scanf("%lf", &x);
	if (x>0 && x<1)
	{
		
	
		while(n > x)
		{
			if(flag)
			{
				pie += n;
			}
			else
			{
				pie -= n;
			}
			i += 2;
			flag = !flag;
			n = 4/i;
		}
		printf("%lf\n", pie);
	}
	return 0;
}
