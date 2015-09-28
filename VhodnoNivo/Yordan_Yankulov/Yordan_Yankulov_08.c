#include<stdio.h>

int main()
{
	int x,i,c = 0,smth[100];
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
			if(arr[i] % 2 != 0)
			{
				smth[c] = arr[i];
				c++;
			}
		}while(arr[i] < x);
	}
	for(i = 0; i < c ; i++)
	{
		printf("%d\n", smth[i]);
	}
	return 0;
}
