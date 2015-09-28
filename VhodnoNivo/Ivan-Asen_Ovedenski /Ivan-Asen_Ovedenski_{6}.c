#include <stdio.h>

int main () 
{	
	int x ;
	printf("Vuvedi edno celochisleno chislo...");
	scanf("%d",&x);
	if (x < 1 || x > 10) 
	{
		return;
	}
	int arr[100] ;
	int i, a, j;
	for (i = 0; i < 100; i++)
	{
		if (i < 50)
		{
			arr[i] = (i-2+15);
		}
		if (i > 50)
		{
			arr[i] = (i-27 + 9);
		}
	}
	for (i = 0;i < 10;i++)
	{
		for (j = i + 1;j < 10; j++)
		{
			if (j % 10 == x)
			{ 
				if (arr[i] < arr[j])
				{
					a = arr[i];
					arr[i] = arr[j];
					arr[j] = a;
				}
			}
		}
	
	}
	for ( i = 0; i < 100; i++)
	{
		printf("%d\n",arr[i]);
	}
	return 0;
}
