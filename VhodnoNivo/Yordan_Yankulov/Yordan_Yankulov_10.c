#include <stdio.h>

int main()
{
	long int a = 1,b = 1,c =1,i = 0,arr[10],x;
	do{
		printf("Insert x > 0 && x < 10\n");
		scanf("%li", &x);
	}while(x < 0 || x >= 10);
	do{
		a = b;
		b = c;
		c = a + b;
		if(c % x == 0)
		{
			arr[i] = c;
			i++;
		}
	}while(i != 9);
	for(i = 0; i < 10; i++)
	{
		printf("%li\n", arr[i]);
	}
	return 0;
}
