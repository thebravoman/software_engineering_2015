#include<stdio.h>
#include<math.h>

int main()
{
	double n[10],d;
	int x,c,s,i,t;

	do{
	printf("Input X:");
	scanf("%d",&x);
	}while(x<0 && 10<x);
	i=0;
	while(i<10)
	{
		c++;
		d = cos(c)*1000;
		s = (int)d;
		if(s%10==x)
		{
			n[i] = cos(c);
			i++;
		}
	}
	
	for(t=0;t<10;t++)
	{
		printf("%f\n",n[t]);
	}
  	
 
  	return 0;
}
