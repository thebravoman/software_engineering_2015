#include<iostream>
#include<cmath>

int next_fib()
{
	static unsigned long long int x=0,px=0;
	if(px==0) { px=1; return 1; }
	if(x==0) { x=1; return 1; }
	unsigned long long int buf = x+px;
	px=x;
	x=buf;
	return buf;
}

int main()
{
	int x;
	std::cout<<"Enter x ( 0<=x<10 ): ";
	std::cin>>x;
	unsigned long long arr[10];
	for(int i=0;i<10;i++)
	{
		for(;;)
		{
			unsigned long long int fib = next_fib();
			if(fib%x==0) { arr[i]=fib; break; }
		}
		std::cout<<arr[i]<<std::endl;
	}
	return 0;
}
