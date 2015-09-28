#include <stdio.h>
#include <math.h>

int main()
{
	int x;
	int i=0;
	double d=0;
	int k=0;
	double a[10];
	
	printf("Enter 0<=X<10 \n");
	scanf("%d", &x);

	while (x>=10 || x<0)
	{
		printf("Enter x (0<=x<10)\n");
		scanf("%d", &x);
	}
	
	while (i<10)
	{
		k=cos(d)*1000;
		if (k<0) k=k*(-1);
		if (k%10 == x)
		{
			a[i]=cos(d);
			i++;
		}
		d++;
	}
	for (i=0; i<10; i++) printf("%f\n", a[i]);
	return 0;
}
