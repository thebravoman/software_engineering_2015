#include<stdio.h>

int main()
{
	int x;
	int y;
	int w;
	int h;
	
	int count=0;
	scanf("%d",&x);
	scanf("%d",&y);
	scanf("%d",&w);
	scanf("%d",&h);	
	int temp_x=x;
	int temp_y=y;	
	int arr[10];
	if(x>0 && y>0 && w>0 && h>0)
	{
		while(temp_x>0 && temp_y>0)
		{
			if(x/w>1 && y/h>1)
			{
				count++;
				temp_x=temp_x-w;
				temp_y=temp_y-h;
			}
		}
		count = count*count;
		printf("count is: %d\n",count);
	}
	
	return 0;
}	
