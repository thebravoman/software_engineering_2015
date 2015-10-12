#include<stdio.h>
#include<time.h>
#include<stdlib.h>
int main()
{
	int i,x;
	time_t t;
	do{
		printf("Insert x > 0 && x < 10\n");
		scanf("%d", &x);
	}while(x < 0 || x > 10);
	int arr[100];
	for(i = 0; i <= 100; i++)
	{
		
		srand((unsigned) time(&t));
		arr[i] = rand() % 100;
		printf("%d\n",arr[i]);
	}
	for(i = 0; i <= 100;i++)
	{
		if(arr[i] % 10 == x)
		{
			printf("%d",arr[i]);
		}
	}
	for(i = 0; i <= 100,i++;)
	{
		if(arr[i] % 10 != x)
		{
			printf("%d",arr[i]);
		}
	}
	
	return 0;
}
