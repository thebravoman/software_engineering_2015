#include<iostream>
#include<vector>
#include<cstdlib>

int main()
{
	int x;
	std::cout<<"Enter x ( 0<x<100 ): ";
	std::cin>>x;
	int arr1[10];
	for(int i=0;i<10;i++) arr1[i] = ( rand()%1000 ) + x + 1;
	std::vector<int> arr2;
	for(int i=0;i<10;i++)
	{
		if(arr1[i]%2!=0) arr2.push_back(arr1[i]);
	}
	for(int i=0;i<arr2.size();i++) std::cout<<arr2[i]<<' '; std::cout<<std::endl;
	return 0;
}
