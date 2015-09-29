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
	
	int i;
	for(i = 0; i < arrSize; i++) {
		array[i] = rand() % 1000 + x; //I didn't understand EXACTLY how to fill in the array with numbers > x, so I made them random
		//cout << array[i] << endl;
	}
	//cout << "New Array:" << endl;
	int const newArrSize = 5;
	int newArray[newArrSize];
	
	int counter = 0;
	int j;
	for(j = 0; j < newArrSize; j++) {
		newArray[j] = array[counter];
		cout << newArray[j] << endl;
		
		counter += 2;
	}
	
	return 0;
}