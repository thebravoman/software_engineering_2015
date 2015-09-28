#include <stdio.h>

int main()
{
	int x;
	scanf("%d",&x);
	int i;
	int j=0;
	int m;
	int arr[100];
	int arr2[100];
	if(x>0)
	{	
		if(x<100)
		{
			for(i = 0; i <= 100; i++) {
				arr[i] = rand() % 100;
				if(arr[i] % 10 == x) {
					m=arr[j];
					arr[j] = arr[i];
					arr[i] = m;
					j++;
				}
			}
	
			for (i=0;i<100;i++)
			{
			
				printf("%d\n",arr[i]);
			}
		}
	}	
	return 0;
}
