#include <stdio.h>

int main()
{
	int x;
	int y;
	scanf("%d",&x);
	scanf("%d",&y);
	int n[50];
	int j;
	int i;
	if(x<y)
	{
		for(i=x;i<=y;i++)
		{
			n[i]=i;
		}
		for(i=0;i<y;i++)
		{
			int del=0;
			for(j=1;j<=n[i];j++)
			{
				if(n[i]%j==0)
				{
				del++;
				}
			}
			if(del == 2)
			{
				if(n[i]%10==3)
				{
				printf("%d\n",n[i]);
				}
			}
		}
		
	}
	return 0;
}
