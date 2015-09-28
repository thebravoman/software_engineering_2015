#include <stdio.h>
#include <math.h>
int main () 
{	
	int x ;
	printf("Vuvedi edno celochisleno chislo...");
	scanf("%d",&x);
	if (x < 1 || x > 10) 
	{
		return;
	}
	int arr[10] ;
	int i, a, j;
	for (i = 0; i < 10; i++)
	{
		arr[i] = cos(i);
	}
	for (i = 0;i < 10;i++)
	{
		for (j = i + 1;j < 10; j++)
		{
			if (arr[i] < arr[j])
			{
				a = arr[i];
				arr[i] = arr[j];
				arr[j] = a;
			}
		
		}
	
	}
	for ( i = 0; i < 10; i++)
	{
		printf("%d\n",arr[i]);
	}
	return 0;
}
