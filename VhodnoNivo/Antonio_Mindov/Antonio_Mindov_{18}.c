#include <stdio.h>

struct divisors_t{
	int numb;
	int isPrime;
};

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
	int x, i;
	struct divisors_t divisors[10];
	int count=0;
	scanf("%d", &x);

	for (i = 1; i < x; i+=2)
	{
		if(x % i == 0)
		{
			divisors[count].numb = i;
			divisors[count].isPrime = isPrime(i);
			count++;
		}
	}

	for (i = 0; i < count; ++i)
	{
		printf("1. %d", divisors[i].numb);

		if(divisors[i].isPrime)
		{
			printf(" is prime");
		}

		printf("\n");
	}

	return 0;
}