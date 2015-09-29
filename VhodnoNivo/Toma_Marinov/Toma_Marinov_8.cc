#include <iostream>
#include <cstdlib>

using namespace std;

int main() {
	int x;
	do {
		cin >> x;
	} while (x < 0 || x > 100);
	cout << endl;
	
	int const arrSize = 10;
	int array[arrSize];
	
	int newArraySize = 0;
	int i;
	for(i = 0; i < arrSize; i++) {
		array[i] = rand() % 1000 + x; //I didn't understand EXACTLY how to fill in the array with numbers > x, so I made them random
		
		if(array[i] % 2 != 0) {
			newArraySize++;
		}
	}
	
	int const newArrSize = newArraySize;
	int newArray[newArrSize];
	
	int counter = 0;
	int j;
	for(j = 0; j < arrSize; j++) {
		if(array[j] % 2 != 0) {
			newArray[counter] = array[j];
			
			counter++;
		}
	}
	
	int k;
	for(k = 0; k < newArrSize; k++) {
		cout << newArray[k] << endl;
	}
	
	return 0;
}