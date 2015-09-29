#include<iostream>

int sum(int div)
{
	int n=0;
	for(int i=1;i<1000;i++) { if(i%div==0) n+=i; }
	return n;
}

int main()
{
	int x;
	std::cout<<"Enter x ( 0<x<10 ): ";
	std::cin>>x;
	int arr[10];
	for(int i=0;i<10;i++)
	{
		arr[i] = sum( (i+1)*x );
	}
	for(int i=0;i<10;i++) std::cout<<arr[i]<<' ';
	std::cout<<std::endl;
	return 0;
}
