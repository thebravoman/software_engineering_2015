#include<stdio.h>
#include<math.h>
#include<stdlib.h>

int main()
{
	int n[100];
	int x,d,c,swap,i;

	do{
	printf("Input X:");
	scanf("%d",&x);
	}while(x<0 && 10<x);
	
	for(i=0;i<100;i++)
	{
		n[i] = rand() % 100;
		
	}

  	for (c = 0 ; c < ( 100 - 1 ); c++)
  	{
    		for (d = 0 ; d < 100 - c - 1; d++)
    		{
      			if (n[d]%10 != x)
      			{
       				swap       = n[d];
        			n[d]   = n[d+1];
        			n[d+1] = swap;
      			}
    		}
 	 }
 
  	printf("Sorted list:\n");
 
  	for ( c = 0 ; c < 100 ; c++ )
     		printf("%d\n", n[c]);
 
  	return 0;
}
