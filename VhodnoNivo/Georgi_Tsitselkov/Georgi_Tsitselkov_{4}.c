#include <stdio.h>
	
int main()
{
	int x,y;
	int sum=0;
	
	printf("Input value of X:\n");
	scanf("%d", &x);
	printf("Input value of y:\n");
	scanf("%d", &y);
	
	if ( y <= x)
		{
		  printf("Y has to be bigger than X !!\n");
		  printf("Enter a new value of Y:\n");
		  scanf("%d", &y);
		}
	int i,a=1,b=0,c=0;	
	for (i < x ; i <= y ; i++)
		{
			if(i >= x)

			{
				printf("%d\n",a);
			}
				
			c = b;
			b = a;
			a = c + b;
		}

	
return 0;
}
