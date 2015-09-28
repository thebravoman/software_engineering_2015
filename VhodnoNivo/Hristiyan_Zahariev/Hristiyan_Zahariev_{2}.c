#include <stdio.h>

int main()
{
	int i;
	int sum=0;
	int x;
	int y;
	
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
		if (x%17 == 0) sum = sum + x;
		x++;
	}
	
	printf("The sum of numbers moded by 17 is: %d\n", sum);
	return 0;
}
