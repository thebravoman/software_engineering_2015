#include<stdio.h>
#include<math.h>

int main()
{
	double n[10];
	int x,d,c,swap,i;

	do{
	printf("Input X:");
	scanf("%d",&x);
	}while(x<0 && 10<x);
	printf("Input order:\n");
	for(i=0;i<10;i++)
	{
		n[i]=cos(i);
		printf("%f\n",n[i]);
	}

  	for (c = 0 ; c < ( 10 - 1 ); c++)
  	{
    		for (d = 0 ; d < 10 - c - 1; d++)
    		{
      			if (n[d] < n[d+1])
      			{
       				swap       = n[d];
        			n[d]   = n[d+1];
        			n[d+1] = swap;
      			}
    		}
 	 }
 
  	printf("Sorted list in descending order:\n");
 
  	for ( c = 0 ; c < 10 ; c++ )
     		printf("%f\n", n[c]);
 
  	return 0;
}
