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

	int zero = 0;
	int one = 1;
	int next;

	int i;
	for (i = 0; i < 40; i++)
	{
		next = zero + one;

		if (next >= x && next <= y)
		{
			cout << next << endl;
		}

		zero = one;
		one = next;
	}

	return 0;
}