#include <stdio.h>
void summing(int x, int y)
{
	int i,sum = 0;
	for(i = x; i <= y; i++)
	{
		if(i % 2 == 0)
		{
			sum += i;
		}
	}

	printf("Summing = %d \n ", sum);
}
int main()
{
	int x,y;
	printf("Insert x \n");
	scanf("%d",&x);
	do
	{
		printf("Insert y > x\n");
		scanf("%d", &y);
	}while(y < x);
	summing(x,y);
	return 0;
}
