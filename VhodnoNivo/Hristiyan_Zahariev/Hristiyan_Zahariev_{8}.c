#include <stdio.h>

int main()
{
	int i;
	int x;
	int j=-1;
	int l=0;
	int a[10];
	printf("Enter x (0<x<100)\n");
	scanf("%d", &x);

	while (x>=100 || x<=0)
	{
		printf("Enter x (0<x<10)\n");
		scanf("%d", &x);
	}
	
	for(i=0; i<20; i++) 
	{
		a[i] = x+i+1;
		if (a[i]%2 != 0)
		{
			a[j] = a[i];
			printf("%d\n", a[j]);
		}
	}
}
