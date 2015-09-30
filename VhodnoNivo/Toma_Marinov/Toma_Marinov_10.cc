#include <iostream>

using namespace std;

int main()
{
	int x;

	while (true)
	{
		cin >> x;

		if (x >= 0 && x < 10)
		{
			break;
		}
		else
		{
			cout << "X must be as follows: 0 <= x < 10" << endl;
		}
	}

	int const sizeOfArray = 10;
	long array[sizeOfArray];
	long zero = 0;
	long one = 1;
	long next;
	long count = 0;

	int i;
	for (i = 0; i < 100; i++)
	{
		next = zero + one;

		if (next % x == 0)
		{
			array[count] = next;
			count++;
		}

		zero = one;
		one = next;
	}

	int j;
	for (j = 0; j < sizeOfArray; j++)
	{
		cout << array[j] << endl;
	}

	return 0;
}