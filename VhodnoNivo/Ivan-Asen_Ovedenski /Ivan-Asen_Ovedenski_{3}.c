#include <stdio.h>

int main () 
{	
	int a , b ;
	printf("Vuvedi dve celochisleni chisla...");
	scanf("%d %d",&a,&b);
	if (a >= b) 
	{
		return;
	}
	int i, counter ;
	
	for (i = a;i <= b; i++)
	{
		if (i % 10 == 3)
		{
			for (counter = 2; counter != i+1; counter++)
			{
				if (counter % i == 0 )
				{
					printf("%d\n", counter);
				}
			}
		}
	}
	return 0;
}
