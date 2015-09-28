#include <stdio.h>

int main()
{
	int x;
	int i=1;
	int k=0;
	int j=0;
	int a[10];
	
	printf("Enter 0<=X<10 \n");
	scanf("%d", &x);

	while (x>=10 || x<0)
	{
		printf("Enter x (0<=x<10)\n");
		scanf("%d", &x);
	}

	for (i=1; i<=x; i++)
	{
		if(x%i == 0)
		{
			if (i%2 != 0)
			{
				a[j] = i;
				printf("The prime and odd numbers are: %d\n", a[j]);
				j++;
			}
		}
	}
}


