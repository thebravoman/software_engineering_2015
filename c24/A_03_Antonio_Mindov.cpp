#include <iostream>

using namespace std;

int main()
{
	int numb;
	cin >> numb;

	for (int i = 2; i < numb + 1; ++i)
	{
		if(numb % i == 0)
		{
			cout << i << "," << numb/i << endl;
		}
	}

	return 0;
}