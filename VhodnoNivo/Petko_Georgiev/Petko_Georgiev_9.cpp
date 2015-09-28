#include<iostream>
#include<cmath>

int main()
{
	int x;
	std::cout<<"Enter x ( 0<=x<10 ): ";
	std::cin>>x;
	double arr[10];
	for(int i=0,i2=0;i<10;i++,i2++)
	{
		for(;;i2++)
		{
			double c = cos(i2);
			if( ((int)(c*1000.0))%10==x ) { arr[i]=c; break; }
		}
		std::cout<<arr[i]<<std::endl;
	}
	return 0;
}
