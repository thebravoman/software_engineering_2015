#include<stdio.h>

int main()
{
	
	int x;
	int array[10];
	int array2[5];
	int i;
	
	
	
	
 	printf("Enter x:");
	scanf("%d", &x);
	
	while (x >=10 || x <= 0)
	{
		printf("enter a new x:");
		scanf("%d", &x);
	}
	
	for(i = 0; i < 10; i++)
	{
		printf("enter a value ");
		scanf("%d", &array[i]);
		
		while(x >= array[i])
		{
			scanf("%d", &array[i]);
		}
	}
	
	for(i = 0; i < 10 ; i++)
	{
		if(i % 2 != 0)
		{
			array2[i / 2] = array[i];	
		}
	}
	
	for (i = 0; i < 5; i++)
	{
		printf("%d\n", array2[i]);
	}
	// 1=0
	// 3=1
	// 5=2
	// 7=3
	// 9=4
	
	
	
	
	


return 0;
}
