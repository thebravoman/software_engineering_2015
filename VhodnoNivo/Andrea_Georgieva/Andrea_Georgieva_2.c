#include<stdio.h>
int Div17(int x, int y)
 {
	int sum = 0;
	int i;
	int div = 17;
	for(i = x; i <= y; i++)
	  {
	   if(i % div == 0)
	     {
	      sum += i;
	     }
	  }
	return sum;
 }
int main()
 {
	int x,y;
	do {
	   printf("Input two numbers(x<y):");
	   scanf("%d %d",&x,&y);
	}while(x>y);
	printf("The sum divided by 17 is: %d\n",Div17(x,y));
	return 0;
}

