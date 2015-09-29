#include <stdio.h>
#include <math.h>

int main()
{	
	int x;
	int j,i,k,l,n;
	double m;
	printf("Enter a number mi frend:\n");
	scanf("%d",&x);
	double arr[10];
	for(i=0;i<10;i++)
	{
		arr[i]=cos(i);
		printf("arr[%d] = %f\n",i,arr[i]);
	}
	for (k=0;k<10;k++)
	{
		for(l=k+1;l<10;l++)
		{
			if(arr[k]<arr[l])
			{
					m=arr[l];
					arr[l] = arr[k];
					arr[k] = m;
					j++;
			}
		}
	}
	
	for(n=0;n<10;n++)
	{
		printf("arr[%d]= %f \n",n,arr[n]);
	}
	return 0;
}
