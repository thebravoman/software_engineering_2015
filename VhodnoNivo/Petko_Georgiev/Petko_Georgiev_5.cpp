#include<iostream>
#include<cmath>
#include<algorithm>
#include<iomanip>

int main()
{
	int x;
	std::cout<<"Enter x ( 0<x<10 ): ";
	std::cin>>x;
	double arr[x];
	for(int i=0;i<x;i++)
	{
		arr[i] = cos(i);
		std::cout << std::fixed << std::setw( 11 ) << std::setprecision(6) << arr[i] << ' ';
	}
	std::cout<<std::endl;
	std::sort(arr,arr+x);
	for(int i=0;i<x;i++)
	{
		std::cout << std::fixed << std::setw( 11 ) << std::setprecision(6) << arr[i] << ' ';
	}
	std::cout<<std::endl;
}
