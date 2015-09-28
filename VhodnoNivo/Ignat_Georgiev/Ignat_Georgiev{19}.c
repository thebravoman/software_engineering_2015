#include<stdio.h>

int isPrime(int n)
{
	int c = 0;
	int i;
	for(i = 2; i < n; i++)
	{
		if(n%1 == 0)
		{
			c = 1;
		}
	}
	if(c = 1)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

int main()
{
	double x;
	double sum=0;
	int first_prime=3;
	int second_prime=5;
	scanf("%lf",&x);
	if (x>0)
		{
			if(x<1)
			{
				sum =(1/(double)first_prime)+ (1/(double)second_prime)	;
				do
				{
					
					
					if(isPrime(first_prime)==1)
					{
						if(isPrime(second_prime)==1)
						{
							sum = (1/(double)first_prime)+(1/(double)second_prime);				
							first_prime=first_prime+2;
							second_prime=first_prime+2;
							printf("%f\n",sum);
						}
					}
					
					
				}
					while(sum>=x);
				
			}
		}
	
	return 0;
}
