#include <iostream>
#include <cmath>

#define _USE_MATH_DEFINES
using namespace std;

int main() {
	int x;
	while(true) {
		cin >> x;
		
		if(x > 0 && x < 10) {
			break;
		} else {
			cout << "X must be as follows: 0 < x < 10" << endl;
		}
	}
	
	int const arrSize = 10;
	double array[arrSize];
	
	int i;
	for(i = 0; i < arrSize; i++) {
		array[i] = cos(i * M_PI / 180.0); //to make it in degrees, because it is normally in radians
	}
	int j;
	for(j = 0; j < arrSize; j++) {
		cout << array[j] << endl;
	}
	
	double swap;
	int k;
	for(k = 0; k < arrSize - 1; k++) {
		if(array[k] < array[k + 1]) {
			swap = array[k];
			array[k] = array[k + 1];
			array[k + 1] = swap;
		}
	}
	
	cout << "Now sorted:" << endl;
	
	for(j = 0; j < arrSize; j++) {
		cout << array[j] << endl;
	}
	
	return 0;
}