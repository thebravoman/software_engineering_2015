#include<stdio.h>
#include<math.h>



int main()
{
	double x;
	double array[10];
	int i = 0;
	double y;
	int n = 0;
	
	printf("enter a value for x\n");
	scanf("%lf", &x);
	
	while (x < 0 || x >10)
	{
		printf("enter a valid value for x (0<=x<10):\n");
		scanf("%lf", &x);
	}
	
	while(i < 10)
	{
		y = cos(n);
		if((int)(y * 1000) % 10 == x)
		{
			array[i] = y;
			i++;
		}
		
		n++;

	}
	
	for(i = 0; i < 10 ;i++)
	{
		
		printf("%lf\n", array[i]);
	} 


return 0;
}
