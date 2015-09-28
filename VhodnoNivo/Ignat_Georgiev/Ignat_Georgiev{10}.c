#include<stdio.h>
#include<math.h>

int Fibonacci(int n)
{
   if ( n == 0 )
      return 0;
   else if ( n == 1 )
      return 1;
   else
      return ( Fibonacci(n-1) + Fibonacci(n-2) );
} 
int main()
{	
	int temp;
	int x;
	int y=0;
	int i=0;
	scanf("%d",&x);
	int arr[10];
	if(x>=0)
	{
		if(x<10)
		{
			while(i<10)
			{	
				temp = Fibonacci(y);
				if(temp!=0)
				if(temp%x==0)
				{
					arr[i]=Fibonacci(y);				
					i++;	
				}		
				y++;
			}
			for(i=0;i<10;i++)
			{
				printf("%d\n",arr[i]);
			}
		}
	}
	return 0;
}
//cos(x)=random;
