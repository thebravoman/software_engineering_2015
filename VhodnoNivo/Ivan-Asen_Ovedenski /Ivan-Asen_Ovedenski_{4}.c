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
	int f1 = 1, f2 = 2,i,f;
	for (i = 2;i != a; i++)
	{
		f = f1 + f2;
		f1 = f2;
		f2 = f;
	}
	for (i = a;i <= b;i++)
	{
		f = f1 + f2;
		f1 = f2;
		f2 = f;
		printf("%d\n",f);
	}
	
	return 0;
}
