#include<iostream>
#include<vector>
std::vector<int> prime;

void add_next_prime()
{
	if(prime.size()==0) { prime.push_back(2); return; }
	for( int i=prime[prime.size()-1]+1;;i++ )
	{
		bool p=1;
		for(int q=0;q<prime.size();q++)
		{
			if( i%prime[q]==0 ) { p=0; break; }
		}
		if(p) { prime.push_back(i); break; }
	}
}

int main()
{
	int x,y,first,last;
	std::cout<<"Enter x and y (x<y): ";
	std::cin>>x>>y;
	prime.clear();
	add_next_prime();

	while( prime[prime.size()-1]<x ) add_next_prime();
	first = prime.size()-1;

	while( prime[prime.size()-1]<=y ) add_next_prime();
	last = prime.size()-2;

	for(int i=first;i<=last;i++)
	{
		if(prime[i]%10==3) std::cout<<prime[i]<<std::endl;
	}

	return 0;
}
