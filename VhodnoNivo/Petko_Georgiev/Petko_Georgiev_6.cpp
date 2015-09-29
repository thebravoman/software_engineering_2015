#include<iostream>
#include<cstdlib>
#include<algorithm>

#define ARR_SIZE 100

int main()
{
	int x;
	std::cout<<"Enter x ( 0<x<10 ): ";
	std::cin>>x;
	int arr[ARR_SIZE];
	for(int i=0;i<ARR_SIZE;i++) arr[i]=rand()%100;

	std::cout<<"Before sort:"<<std::endl;
	for(int i=0;i<ARR_SIZE;i++) std::cout<<arr[i]<<' ';

	int index=0,i;
	for(;;)
	{
		for(;index<ARR_SIZE;index++)
		{
			if(arr[index]%10!=x) break;
		}
		for(i=index+1;i<ARR_SIZE;i++)
		{
			if(arr[i]%10==x) { std::swap( arr[index] , arr[i] ); break; }
		}
		index++;
		if(i>=ARR_SIZE) break;
	}

	std::cout<<std::endl<<"After sort:"<<std::endl;
	for(int i=0;i<ARR_SIZE;i++) std::cout<<arr[i]<<' ';
	std::cout<<std::endl;
	return 0;
}
