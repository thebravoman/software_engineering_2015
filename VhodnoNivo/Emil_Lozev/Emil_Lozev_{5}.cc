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
	while(x < 0 || x > 10);
	
	double arr[10];
	
	for(int i = 0; i < 10; i++)
	{
		arr[i] = cos(i);
	}
	
	for(int i = 0; i < 10; i++)
	{
		cout << "Cos(" << i << ") = " << arr[i] << endl;
 	}
	
 return 0;
}
