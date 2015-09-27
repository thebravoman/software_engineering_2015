#include<iostream>

int sum(int top)
{
	int n = 1+top;
	n *= (int)(top/2);
	if(top%2!=0) n+=(int)(top/2)+1;
	return n;
}

int main()
{
	int x;
	std::cout<<"Enter x ( 0<x<10 ): ";
	std::cin>>x;
	int arr[10];
	int N=0;
	for(int i=0;i<10;i++)
	{
		for(;;N++) { if(N%x==0) { arr[i]=sum(N); N++; break; } }
	}
	for(int i=0;i<10;i++) std::cout<<arr[i]<<' ';
	std::cout<<std::endl;
	return 0;
}
