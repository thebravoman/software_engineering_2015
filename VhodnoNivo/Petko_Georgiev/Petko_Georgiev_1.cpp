#include<iostream>
int main()
{
	int x,y;
	std::cout<<"Enter x and y (x<y): ";
	std::cin>>x>>y;
	int res=0;
	if(x%2==0) x++;
	for(;x<=y;x+=2) sum+=x;
	std::cout<<"The result is "<<sum<<std::endl;
	return 0;
}
