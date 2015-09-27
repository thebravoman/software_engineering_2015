#include<iostream>

int next_fib()
{
	static int last_x=0,last2_x=0;
	if(last2_x==0) { last2_x=1; return 1; }
	if(last_x==0) { last_x=1; return 1; }
	int res = last_x+last2_x;
	last2_x=last_x;
	last_x=res;
	return res;
}

int main()
{
	int x,y;
	std::cout<<"Enter x and y (x<y): ";
	std::cin>>x>>y;
	for(;;)
	{
		int i = next_fib();
		if(i>y) break;
		if(i>=x) std::cout<<i<<std::endl;
	}
	return 0;
}
