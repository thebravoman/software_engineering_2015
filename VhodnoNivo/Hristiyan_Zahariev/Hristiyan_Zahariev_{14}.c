#include <stdio.h>

int main()
{
	int i=0;
	int x;
	int k=0;
	int n;
	int sum=0;
	int a[10];
	
	printf("Enter 0<X<10 \n");
	scanf("%d", &x);

	while (x>=10 || x<=0)
	{
		printf("Enter x (0<x<10)\n");
		scanf("%d", &x);
	}
	for (n=1; n<=x; n++)
	{
		if (x%n == 0) 
		{
			sum = 0;
			for (i=0; i<=n; i++) sum = sum + i;
			a[k] = sum;
			k++;
		}
		
	}
	for (i=0; i<k; i++) printf("Element of array[%d] is euqal to: %d\n", i,a[i]);
	return 0;


}
