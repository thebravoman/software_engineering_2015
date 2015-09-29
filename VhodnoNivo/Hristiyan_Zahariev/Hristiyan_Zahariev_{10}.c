#include <stdio.h>

int main()
{
	int x;
	int i=0;
	double d=0;
	int k=0;
	int a[10];
	int fibo=1;
	int fibo2=1;
	int fibo3=0;
	
	printf("Enter 0<=X<10 \n");
	scanf("%d", &x);

	while (x>=10 || x<0)
	{
		printf("Enter x (0<=x<10)\n");
		scanf("%d", &x);
	}
	
	while (i<10)
	{
		fibo3 = fibo + fibo2;
		fibo = fibo2;
		fibo2 = fibo3;
		if (fibo3%x == 0)
		{
			a[i] = fibo3;
			i++;
		} 
	}
	for (i=0; i<10; i++) printf("%f\n", a[i]);
	return 0;
}
