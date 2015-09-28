#include <stdio.h>

int fibonacci(int term)
{
    
	if(term <= 2)
       		return 1;
    	return fibonacci(term - 1) + fibonacci(term - 2);
}


int main()
{
	
	int x, c, i, t, d;
	int n[10];

	do{
	printf("Input X:");
	scanf("%d",&x);
	}while(x<0 && 10<x);
	
	i = 0;
	c = 0;

	while(i<10)
	{
		c++;
		d = fibonacci(c);
		if(d % x == 0)
		{
			n[i] = d;
			i++;
		}
		
	}

	for(t=0;t<10;t++)
	{
		printf("%d\n",n[t]);
	}
	return 0;
}

	
