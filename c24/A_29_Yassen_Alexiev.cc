#include <iostream>

using namespace std;

int main () {
	int my_Number;

	cin >> my_Number;

	for (int i = 2; i < my_Number + 1; i++) {
		if (my_Number % i == 0) {
			cout << i << endl;
		}
	}
	return 0;
}