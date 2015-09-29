#include <stdio.h>

int main()
{
	int i;
	int sum=0;
	int x;
	int j;
	int y;
	int not_prime=0;
	
	printf("Enter x!\n");
	scanf("%d", &x);
	printf("Enter y (y>x)!\n");
	scanf("%d", &y);
	printf("Numbers in the interval [x;y] (for x= %d; y= %d) are:\n",x,y);
	for (i=x; i<y+1; i++) printf("%d\n", i);
	while (x>y) {
		printf("Y has to be bigger than X!\n");
		printf("Enter y again\n");
		scanf("%d", &y);
	}	
	while (y>=x) {
		not_prime=0;
		for(j=2; j<=x/2; ++j)
		{
			if(x%j==0)
			{
				not_prime=1;
				break;
			}
		}
		if(not_prime==0 && x % 10 == 3)
		printf("The numbers that ends on 3 and are prime are: %d\n", x);
		x++;
	}
	return 0;
}
