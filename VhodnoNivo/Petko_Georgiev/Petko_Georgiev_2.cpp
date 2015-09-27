#include<iostream>
int main()
{
	int x,y;
	std::cout<<"Enter x and y (x<y): ";
	std::cin>>x>>y;
	int res=0;
	for(;x<=y;x++)
	{
		if(x%17==0) res+=x;
	}
	std::cout<<"The result is "<<res<<std::endl;
	return 0;
}
