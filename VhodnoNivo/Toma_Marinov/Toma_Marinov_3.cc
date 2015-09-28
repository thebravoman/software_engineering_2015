#include <iostream>

using namespace std;

int main()
{
	int x = 0;
	int y = 0;

	while (true)
	{
		cin >> x;
		cin >> y;

		if (x < y)
		{
			break;
		}
		else
		{
			cout << "X must be less than Y!" << endl;
		}
	}

	bool isPrime = true;
	int primeNumber;
	int i;
	int j;
	for (i = x; i <= y; i++)
	{
		isPrime = true;
		for (j = 2; j < i; j++)
		{
			if (i % j == 0)
			{
				isPrime = false;
				break;
			}
		}
		if (isPrime && i % 10 == 3)
		{
			cout << i << endl;
		}
	}

	return 0;
}