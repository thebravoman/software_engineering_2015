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
			cout << "X must be less than Y" << endl;
		}
	}

	int value = 0;
	int i;
	for (i = x; i <= y; i++)
	{
		if (i % 2 != 0)
		{
			value += i;
		}
	}

	//cout << x << " " << y << endl;
	cout << "The value is: " << value << endl;

	return 0;
}