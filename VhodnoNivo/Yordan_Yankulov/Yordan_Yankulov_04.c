#include <stdio.h>
void fibon(int x, int y)
{
	int a = 1,b = 1,c =1,i;
	for(i = x; i <= y; i++)
	{
		a = b;
		b = c;
		c = a + b;
		if(c >= x && c <= y)
		{
			printf("%d\n", c);
		}
	}
	 
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
	fibon(x,y);
	return 0;
}
