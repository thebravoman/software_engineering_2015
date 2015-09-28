#include <stdio.h>

int main () 
{	
	int x ;
	printf("Vuvedi edno celochisleno chislo...");
	scanf("%d",&x);
	if (x < 1 || x > 100) 
	{
		return;
	}
	int arr[10] ;
	int i = 0, f, f1 = 1,f2 = 2;
	
	do {
		f = f1 + f2;
		f1 = f2;
		f2 = f;
		if (f % x == 0)
		{
			arr[i] = f;
			i++;
			//printf("i -%d ,f -%d\n",i,f);
		}
	}while (i < 10);
	
	for ( i = 0;i < 10; i++)
	{
		printf("%d\n",arr[i]);
	}
	return 0;
}
