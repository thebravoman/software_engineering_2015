#include <stdio.h>

int main()
{
	int i;
	int x;
	int j=0;
	int m,k,l,d;
	int swap;
	int a[100];
	printf("Enter x (0<x<10)\n");
	scanf("%d", &x);

	while (x>10 || x<=0)
	{
		printf("Enter x (0<x<10)\n");
		scanf("%d", &x);
	}

	for(i = 0; i <= 100; i++) 
	{
		a[i] = rand() % 100;
		if(a[i] % 10 == x) {
			swap=a[j];
			a[j] = a[i];
			a[i] = swap;
			j++;
		}
	}
	for (i=0; i<100; i++) printf("%d\n", a[i]);
}
