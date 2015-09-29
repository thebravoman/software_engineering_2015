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

	int sum = 0;
	int i;
	for (i = x; i <= y; i++)
	{
		if (i % 17 == 0)
		{
			sum += i;
		}
	}

	cout << "The sum of the numbers divided by 17 is: " << sum << endl;
	
	return 0;
}