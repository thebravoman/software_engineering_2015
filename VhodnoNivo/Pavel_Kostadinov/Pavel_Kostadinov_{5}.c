#include<stdio.h>
#include<math.h>
#include<stdlib.h>

int main()
{
	int i;
	int z;
	int x;
	double y;
	double array[10];
	
	printf("Enter x:");
	scanf("%d", &x);
	
	while (x >=10 || x <= 0)
	{
		printf("enter a new x:");
		scanf("%d", &x);
	}
	
	for(i = 0; i < 10; i++)
	{
		array[i] = cos(i);
	}
	
	for(i = 0; i < 10; i++)
	{
		printf("%lf\n", array[i]);
	}
	
	for(i = 0; i < 10; i++)
	{
		for(z = i + 1; z < 10; z++)
		{
			if(array[i] < array[z])
			{
				y = array[i];
				array[i] = array[z];
				array[z] = y;
			}
		}
	}
	
	printf("Sorted\n");
	
	for(i = 0; i < 10; i++)
	{
		printf("%lf\n", array[i]);
	}		
	



return 0;
}
