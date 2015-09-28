#include <stdio.h>

int isPrime(int numb)
{
	int i;

	for (i = 2; i < numb/2+1; ++i)
	{
		if(numb % i == 0)
		{
			return 0;
		}
	}

	//printf("%d\n", numb);
	return 1;
}

int main()
{
	double x;
	scanf("%lf", &x);
	int lastPrime = 2;
	int currNumb = 3;

	while(1)
	{
		if(isPrime(currNumb))
		{
			if(lastPrime+2 == currNumb)
			{
				//printf("%d,%d\n",lastPrime, currNumb);
				//printf("%lf\n", 1/(double)lastPrime);
				double ratio = 1/(double)lastPrime + 1/(double)currNumb;
				printf("%lf\n", ratio);

				if(ratio < x)
				{
					break;
				}
			}

			lastPrime = currNumb;
		}

		currNumb++;
	}

	return 0;
}