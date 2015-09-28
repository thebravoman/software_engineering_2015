#include <stdio.h>

 
	
int main()
{
    	int terms, counter, x, y;

    	do{
	printf("Please enter X:");
	scanf("%d",&x);
	printf("Please enter Y:");
	scanf("%d",&y);
	}while(y<x);
    
    	printf("Fibonacci numbers between %d and %d are\n", x, y); 
    	for(counter = x; counter < y; counter++)
	{
        	printf("%d ", fibonacci(counter));
    	}
    	
    	return 0;
}

int fibonacci(int term)
{
    
	if(term <= 2)
       		return 1;
    	return fibonacci(term - 1) + fibonacci(term - 2);
}
