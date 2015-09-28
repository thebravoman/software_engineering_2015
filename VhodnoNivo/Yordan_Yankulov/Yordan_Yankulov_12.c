#include <stdio.h>
// program for the wooden 
int main()
{
	int x,h,y,w,division,mult, sum,arr[10],i,subtraction;
	do{
		printf("Insert the weight:\n");
		scanf("%d", &x);
		printf("Insert the height:\n");
		scanf("%d", &y);
		printf("Insert the weight and the height of yours:\n");
		scanf("%d", &w);
		scanf("%d", &h);
	}while((x <= 0) || (y <= 0) || (w <= 0) || (h <= 0));
	division = x / w;
	sum = division;
	division = y / h;
	mult = sum * division;
	subtraction = x - w;
	arr[0] = subtraction;
	for(i = 1; i < sum - 1; i++)
	{
		subtraction -= w;
		arr[i] = subtraction;
	}
	printf("%d\n", mult);
	for(i = 0; i < sum - 1; i++)
	{
		printf("%d\n", arr[i]);
	}
	return 0;
}
