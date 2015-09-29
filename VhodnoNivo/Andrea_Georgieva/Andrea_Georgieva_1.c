#include<stdio.h>
#include<stdlib.h>
	
int SumOfNum(int x, int y)
 {
	int i;
	int div = 2;
	int sum = 0;
	for(i = x; i <= y; i++)
	 {
	 if(i > 1)
		{
		while(i % div != 0)
		 {
		  div++;
		 }
		}
	 if(i == div)
	     {
	 sum += i;
	     }
  	 div = 2;
  	     }
	return sum;
  }


int main()
 {
	int x,y;
 	do{
	  printf("Input two numbers (x<y):");
	  scanf("%d %d",&x,&y);
	          }while(x>y);
	printf(" The sum is: %d\n",SumOfNum(x,y));
	return 0;
 }

