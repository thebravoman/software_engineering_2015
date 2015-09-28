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
	int i ;
	int sum = 0;
	//printf("%d %d\n", a,b);
	for (i = a;i <= b; i++)
	{
		if (i % 2 != 0)
		{
			sum = sum + i;	
		}
	}
	printf("%d\n", sum);
	return 0;
}
