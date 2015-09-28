#include<stdio.h>

int main()
{
	int x,i,c = 0,smth[5];
	do{
		printf("Insert x > 0 && x < 100\n");
		scanf("%d", &x);
	}while(x < 0 || x >= 100);
	int arr[10];
	for(i = 0 ; i < 10; i++)
	{
		do{
			printf("Insert arr elements > x:\n");
			scanf("%d",&arr[i]);
		}while(arr[i] < x);
	}
	for(i = 0; i < 10; i++)
	{
			if(i == 0)
			{
				smth[c] = arr[i+1];
				c++;
			}
			else{
				if((i % 2 != 0) && (i != 0))
				{
					smth[c] = arr[i];
					c++;
				}
			}
			
	}
	for(c = 0; c < 5; c++)
	{
		printf("%d\n", smth[c]);
	}
	return 0;
}	
