#include<iostream>
#include<cmath>

using namespace std;

int main()
{
	int x;
	
	do
	{
		cout << "Enter x: ";
		cin >> x;
	}
	while(x <= 0 || x >= 10);
	
	double arr[10];
	
	double sum = 0;
	int z = 0;
	int n = 0;
	
	for(int i = 0; i < 10; i++)
	{
		sum = 0;
		z = n * x;
		
		do
		{
			sum += cos(z);
			z++;
		}
		while(z < (n+1)*x);
		
		arr[i] = sum;
		n++;
	}
	
	for(int i = 0; i < 10; i++)
	{
		cout << "Element " << i << " is equal to " << arr[i] << endl;
	}
	
 return 0;
}
