#include<stdio.h>

int main()
{
	int x;
	int i;
	int j=0;
	scanf("%d",&x);
	int arr[10];
	int arr2[5];
	if (x>0)
	{
		if(x<100)
		{
			for (i=0;i<10;i++)
			{
				arr[i]=x+i;	
				if(i%2!=0)
					{
						arr2[j]=arr[i];
						printf("%d\n",arr2[j]);
					}
				j++;
			}
		}
	}
	return 0;
}
