#include<iostream>
#include<cmath>

int main()
{
	int x;
	std::cout<<"Enter x (0<x<10): ";
	std::cin>>x;
	double arr[10];
	for(int i=0;i<10;i++)
	{
		double sum=0;
		for(int q=i*x;q<(i+1)*x;q++) sum+=cos(q);
		arr[i]=sum;
	}
	for(int i=0;i<10;i++) std::cout<<arr[i]<<' ';
	std::cout<<std::endl;
	return 0;
}
