#include<iostream>

bool is_prime(int n)
{
	for(int i=2;i<n/2;i++) { if(n%=i) return 0; }
	return 1;
}

int main()
{
	int x;
	std::cout<<"Enter x ( 0<x<10 ): ";
	std::cin>>x;
	int arr[10];
	for(int i=0,q=0;i<10;q++)
	{
		arr[i] = q*2+1;
		if(arr[i]%x==0) i++;
	}
	std::cout<<"odd numbers:"<<std::endl;
	for(int i=0;i<10;i++) std::cout<<arr[i]<<' ';
	std::cout<<std::endl<<"odd prime numbers:"<<std::endl;
	for(int i=0;i<10;i++)
	{
		if(is_prime(arr[i])) std::cout<<arr[i]<<' ';
	}
	std::cout<<std::endl;
	return 0;
}
