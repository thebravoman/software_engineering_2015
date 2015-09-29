#include<stdio.h>

int main()
{
	int i;
	int x;
	int y;
	int n;
	int f;
	do{
	printf("Please enter X:");
	scanf("%d",&x);
	printf("Please enter Y:");
	scanf("%d",&y);
	}while(y<x);
	
	for(n=x;n<y;n++)
	{
		f=0;
		for(i=2;i<=n/2;i++)
		{
			if(n%i==0)
			{
				f=1;
				
			}	
		}
		if(f==0)
		{
			if(n%10==3)
			{
				printf("%d\t",n);
			}
		}

	}
	printf("\n");
	return 0;
}
