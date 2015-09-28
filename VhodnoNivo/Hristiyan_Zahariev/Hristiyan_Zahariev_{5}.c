#include <stdio.h>
#include <math.h>

int main()
{
	int i;
	int x;
	int j,m,k,l,d;
	double swap;
	double a[10];
	
	printf("Enter x! (0<x<10)\n");
	scanf("%d", &x);
	if (0<=x || x<=10) {
		for(i=0; i<=10; i++) {
			a[i] = cos(i);
			printf ("a[%d] = %f\n", i, a[i]);
		}
		for (k = 0 ; k < 10; k++)
		{
			for (l = k; l < 10; l++)
			{
				if (a[k] < a[l])
				{
					swap = a[k];
					a[k] = a[l];
					a[l] = swap;
				}
			}
		}
	}
	
	for (i=0; i<10; i++) {
		printf("a[%d] = %f\n", i, a[i]);
	}
	return 0;
}
	
		
