#include<iostream>

unsigned long long int next_fib()
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
	std::cout<<"Enter x ( 0<x<10 ): ";
	std::cin>>x;
	unsigned long long int arr[10];
	for(int i=0;i<10;i++)
	{
		unsigned long long int n;
		for(;;)
		{
			n = next_fib();
			if(n%10==x) { break; }
		}
		arr[i]=n;
	}
	for(int i=0;i<10;i++) std::cout<<arr[i]<<' ';
	std::cout<<std::endl;
	return 0;
}
