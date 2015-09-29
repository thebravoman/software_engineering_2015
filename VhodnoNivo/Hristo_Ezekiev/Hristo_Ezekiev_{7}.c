#include <stdio.h>
#include <stdlib.h>

int main()
{
	int x, n[10], r, i = 0, t[5], t1 =0;	
	
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
		t[t1] = n[i];
		i++;
		t1++;
	}
	printf("The second array's numbers are: \n");
	for(i=0;i<5;i++)
	{
		printf("%d\n", t[i]);
	}
	
	
	return 0;
}

