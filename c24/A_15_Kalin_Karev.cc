//#include <math.h>
#include <iostream>
//#include <cstdlib>

using namespace std;

int main() {

	int number;
	int c; // counter

	cin >> number;

	for(int i = 2; i < number; i++) {
		if(number % i == 0) {
			cout << i << endl;
			c++;
		}
	}

	//cout << "Number of divisors: " << c << endl;

	return 0;
}