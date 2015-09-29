#include <stdio.h>

int main()
{
	int i;
	int d=0;
	int sum=0;
	int x;
	int y;
	int fibo=1;
	int fibo2=1;
	int fibo3=0;
	
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
	if (x<=1) {
		printf("The numbers of finunachi in the interval are: %d\n", fibo);
		printf("The numbers of finunachi in the interval are: %d\n", fibo2);
	}	
	while (y>=x) {
			fibo3 = fibo + fibo2;
			fibo = fibo2;
			fibo2 = fibo3;
			if (fibo3 > y) break;
			printf("The numbers of finunachi in the interval are: %d\n", fibo3);
	}

	
	return 0;
}
