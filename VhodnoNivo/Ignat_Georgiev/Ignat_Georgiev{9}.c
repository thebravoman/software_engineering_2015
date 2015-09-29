#include<stdio.h>
#include<math.h>

int main()
{	
	int temp;
	int x;
	double y=0;
	int i=0;
	scanf("%d",&x);
	double arr[10];
	if(x>=0)
	{
		if(x<10)
		{
			while(i<10)
			{	
				temp = cos(y)*1000;
				
				if(temp<0)
				temp=temp*(-1);
				if(temp%10==x)
				{
					arr[i]=cos(y);				
					i++;	
				}			
				y++;
			}
			for(i=0;i<10;i++)
			{
				printf("%f\n",arr[i]);
			}
		}
	}
	return 0;
}
//cos(x)=random;
