#include <iostream>

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
	
	cout << endl;
	
	int const arrSize = 10;
	int array[arrSize];
	
	int count = 0;
	
	int i;
	for(i = 3; i < 10000; i++) {
		bool flag = true;
		int j;
		for(j = 2; j < i; j++) {
			if(i % j == 0) {
				flag = false;
				break;
			}
		}
		if(flag) {
			if(i % 10 == x) {
				array[count] = i;
				
				count++;
			}
		}
	}
	
	int k;
	for(k = 0; k < arrSize; k++) {
		cout << array[k] << endl;
	}
	
	return 0;
}