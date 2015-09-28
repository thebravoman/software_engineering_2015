#include <stdio.h>
#include <stdlib.h>

int main()
{
	int x, n[10], r, i = 0, t[10], t1 =0;	
	
	do{
	printf("Please enter X:");
	scanf("%d",&x);	
	}while(x<0 || x>100);

	srand(time(NULL));
	
	while(i<10)
	{
		r = rand() % 100 +x;
		if(r>x)
		{
			n[i] = r;
			i++;
		}
	}
	
	for(i=0;i<10;i++)
	{
		if(n[i] % 2 !=0)
		{
			t[t1] = n[i];
			t1++;
		}
	}
	
	printf("The odd numbers from the first array are: \n");
	for(i=0;i<t1;i++)
	{
		printf("%d\n", t[i]);
	}
	
	
	return 0;
}
