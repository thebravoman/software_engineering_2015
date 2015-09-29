#include<iostream>
#include<iomanip>
int main()
{
	double x;
	std::cout<<"Enter x: ";
	std::cin>>x;
	double pi=0.0;
	bool sign=1;
	for(int i=0;;i++)
	{
		double d=4.0/(i*2.0+1.0);
		if(d<x) break;
		if(sign) pi+=d;
		else pi-=d;
		sign=!sign;
	}
	std::cout<<std::setprecision(19)<<pi<<std::endl;
	return 0;
}
