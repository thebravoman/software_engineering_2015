#include <stdio.h>

int main () 
{
	int a , b;
	printf("Vuvedi dve celochisleni chisla ...");
	scanf("%d %d",&a , &b);
	
	if (a >= b )
	{
		return;
	}
	int sum = 0;
	
	int i;
	for (i = a;i < b;i++)
	{
		
		if (i % 17 == 0)
		{
			sum = sum + i;
		}
	}
	printf("%d\n", sum );
	return 0;
}
