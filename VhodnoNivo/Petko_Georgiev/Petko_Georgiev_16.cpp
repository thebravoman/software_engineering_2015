#include<iostream>
#include<vector>
std::vector<int> prime;

bool is_prime(int n)
{
	bool b=1;
	for(int i=0;i<prime.size();i++) { if(n%prime[i]==0) b=0; }
	return b;
}

int add_prime()
{
	if(prime.size()==0) { prime.push_back(2); return 2; }
	int n=prime[prime.size()-1]+1;
	for(;;n++)
	{
		if(is_prime(n)) { prime.push_back(n); return n; }
	}
}

int main()
{
	int x;
	std::cout<<"Enter x ( 0<x<10 ): ";
	std::cin>>x;
	int arr[10];
	for(int i=0;i<10;i++)
	{
		int n;
		for(;;)
		{
			n = add_prime();
			if(n%10==x) { break; }
		}
		arr[i]=n;
	}
	for(int i=0;i<10;i++) std::cout<<arr[i]<<' ';
	std::cout<<std::endl;
	return 0;
}
