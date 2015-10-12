#include <iostream>
#include <cstdlib>

using namespace std;

int main() {
	int x;
	do {
		cin >> x;
	} while (x < 1 || x > 9);

	int const arrSize = 100;
	int array[arrSize];

	int i;
	for (i = 0; i < arrSize; i++) {
		array[i] = rand() % 100;
	}

	int swap;
	int count = 0;
	int j;
	for (j = 0; j < arrSize; j++) {
		if (array[j] % 10 == x) {
			swap = array[count];
			array[count] = array[j];
			array[j] = array[count];

			count++;
		}
	}

	int k;
	for (k = 0; k < arrSize; k++) {
		cout << array[k] << endl;
	}
	
	return 0;
}