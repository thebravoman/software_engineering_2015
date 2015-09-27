#include<stdio.h>
#include<math.h>
int main()
{
	int x,i,c,Sorted = 0;
	float helper;
	do{
		printf("Insert x > 0 && x < 10\n");
		scanf("%d", &x);
	}while(x < 0 || x > 10);
	float arr[10];	
	for(i = 0; i < x; i++)
	{
		arr[i] = cos(i);
		printf("Once:\n");
		printf("%f\n", arr[i]);
	}
	while(!Sorted)
	{
		Sorted = 1;
		for(c = 0; c < x - 1; c++)
		{
			for(i = 0; i < x - 1 - c; i++){
			if(arr[i] < arr[i+1])
			{	
				Sorted = 0;
				helper = arr[i];
				arr[i] = arr[i+1];
				arr[i+1] = helper;
			}
			}
		}
	}
	for(i = 0; i < x; i++)
	{
		
		printf("Twice:%f\n", arr[i]);
	}
		
	return 0;
}
