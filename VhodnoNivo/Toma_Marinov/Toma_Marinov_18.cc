#include <iostream>

using namespace std;

int main() {

	int x;
	do {
		cin >> x;
	} while (x < 0);

	int const arrSize = 10;
	int array[arrSize];

	int count = 0;
	int i;
	for (i = 3; i < 10000; i++) {
		if (count > 9) {
			break;
		}
		if (x % i == 0 && i % 2 != 0) {
			array[count] = i;
			count++;
		}
	}
	int j;
	for (j = 0; j < arrSize; j++) {
		cout << array[j];

		bool flag = true;
		int k;
		for (k = 2; k < array[j]; k++) {
			if (array[j] % k == 0) {
				flag = false;
				break;
			}
		}
		if (flag) {
			cout << " is prime" << endl;
		}
		else {
			cout << " is not prime" << endl;
		}
	}

	return 0;
}