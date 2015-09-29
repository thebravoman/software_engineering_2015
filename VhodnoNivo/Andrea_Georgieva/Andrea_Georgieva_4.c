#include<stdio.h>
int Fib(int i)
 {
	int res_fib = 0;
	int fib_first = 0;
	int fib_second = 1;
	while(res_fib < i)
	 {
	  res_fib = fib_second + fib_first;
	  fib_first = fib_second;
	  fib_second = res_fib;
	 }
	if(res_fib == i)
	 {
	  printf("Fibonacci numbers: %d\n",i);
	 }
	return 0;
 }
int main()
 {
	int x;
	int y;
	int i;
	do{
	  printf("Input two numbers(x<y):");
	  scanf("%d %d",&x,&y);
	  }while(x > y || x < 0 || y < 0);
	for(i = x; i <= y; i++)
	  {
	   Fib(i);
	  }
	return 0;
 }

