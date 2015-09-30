#include<iostream>
#include<vector>
std::vector<int> prime;

bool is_prime(int n)
{
	bool b=0;
	for(int i=0;i<prime.size();i++)
	{
		if(n%prime[i]==0) return 0;
		if(n>prime[i]) return 0;
	}
	return 1;
}

int AddPrime()
{
	if(prime.size()==0) { prime.push_back(2); return 2; }
	for(int i=prime[prime.size()-1]+1;;i++)
	{
		bool b=1;
		for(int q=0;q<prime.size();q++)
		{
			if(i%prime[q]==0) { b=0; break; }
		}
		if(b) { prime.push_back(i); return i; }
	}
}

void GetTwinPrimes(int &a,int &b)
{
	static int last=2;
	for(;;)
	{
		a=last;
		b=AddPrime();
		if(a+2==b)
		{
			last = b;
			return;
		}
		last=b;
	}
}

int main()
{
	AddPrime();
	double x;
	std::cout<<"Enter x ( 0<x<1 ): ";
	std::cin>>x;
	double sum=0;
	for(;;)
	{
		int a,b;
		GetTwinPrimes(a,b);
		sum = (double)a/b + (double)b/a;
		if((double)a/b>x) { break; }
	}
	std::cout<<sum<<std::endl;
	return 0;
}
