#include <stdio.h>
#include <math.h>
void division(int x, int y)
{
	int i,count = 2,helper,helper2;
	int digit;
	for(i = x; i <= y; i++)
	{
		digit = sqrt(i);
		while(count <= digit && count != 1)
		{
			
			if(i % count == 0)
			{
				count = 1;
				
			}
			else {count++;}
			if(count == digit)
			{
				helper2 = i;
				helper = helper2 % 10;
				helper2 /= 10;
				
				if (helper == 3)
				{
					printf("%d\n",i);
				}
			}
		}
		count = 2;
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
	division(x,y);
	return 0;
}
