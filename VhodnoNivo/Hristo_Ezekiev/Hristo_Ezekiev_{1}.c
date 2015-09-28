#include<stdio.h>

int main()
{
	int x;
	int y;
	int n;
	int p=0;
	do{
	printf("Please enter X:");
	scanf("%d",&x);
	printf("Please enter Y:");
	scanf("%d",&y);
	}while(y<x);
	
	for(n=x;n<y;n++)
	{
		if(n%2!=0)
		{
			p=p+n;
		}
	}
	printf("The sum of the odd numbers between X and Y is %d\n",p);
	return 0;
}
	
