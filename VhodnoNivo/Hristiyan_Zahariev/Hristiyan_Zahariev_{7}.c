#include <stdio.h>

int main()
{
	int i;
	int x;
	int j=0;
	int l=0;
	int a[10];
	int b[5];
	printf("Enter x (0<x<100)\n");
	scanf("%d", &x);

	while (x>=100 || x<=0)
	{
		printf("Enter x (0<x<10)\n");
		scanf("%d", &x);
	}
	
	for(i=0; i<10; i++) 
	{
		a[i] = i+x+1;
		if (i%2 == 0)
		{
			b[j] = x+i+1;
			j++;
		}
	}
	for (j=0; j<5; j++) printf("%d\n", b[j]);
	return 0;
}
