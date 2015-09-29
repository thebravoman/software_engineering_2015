#include<stdio.h>
#include<time.h>
#include<stdlib.h>

int main()
{
	int x;
	int i;
	int z;
	int y;
	int array[100];
	
	
	printf("Enter x:");
	scanf("%d", &x);
	
	while (x >=10 || x <= 0)
	{
		printf("enter a new x:");
		scanf("%d", &x);
	}
	
	srand(time(NULL));
	
	for(i = 0; i < 100; i++)
	{
		array[i] = rand() % 100;
	} 
	
	for(i = 0; i < 100; i++)
	{
			for(z = i + 1; z < 100 ; z++)
			{
				if(array[i] % 10 != x)
				{
			
					y = array[i];
					array[i] = array[z];
					array[z] = y;
				}
			
			}
		
	}
	for(i = 0; i < 100; i++)
	{
		printf("%d\n", array[i]);
	}



return 0;
}
