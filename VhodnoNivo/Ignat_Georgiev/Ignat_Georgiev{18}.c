#include<stdio.h>

int main()
{	
	int x;
	int y=0;
	scanf("%d",&x);
	int arr[10];
	int i=1;
	while(i<x)
	{
		if (x%i==0)
		{
			if (i%2!=0)
			{
				arr[y]=i;
				printf("%d\n",arr[y]);
				y++;
			}
		}
		i++;
	
	}
	
	return 0;
}
