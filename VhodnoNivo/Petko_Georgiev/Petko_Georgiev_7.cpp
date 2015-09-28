#include<iostream>
#include<cstdlib>

int main()
{
	int x;
	std::cout<<"Enter x ( 0<x<100 ): ";
	std::cin>>x;
	int arr1[10];
	for(int i=0;i<10;i++) arr1[i] = ( rand()%1000 ) + x + 1;
	int arr2[5];
	for(int i=0;i<5;i++) arr2[i] = arr1[i*2+1];
	for(int i=0;i<5;i++) std::cout<<arr2[i]<<' '; std::cout<<std::endl;
	return 0;
}
