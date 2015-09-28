#include <iostream>
#include <cmath>
//#include <algorithm> 

using namespace std;

int main () {

	int x,i;
	int k;	
	double remember;
	
	do {
		cin >> x ; 
	}while ((x < 0) || (x > 10)) ;
	
	double arr[x];
	
	for (i = 0 ; i < x ; i++) {
		arr[i] = 0;
	}
	
	for (i = 0 ; i < x ; i++) {
		arr[i] = cos(i);
		cout << arr[i] << " ";
	}
	cout << "\nSORTED: \n";

	for (i = 0 ; i < x-1 ; i++) {
		for (k = 0 ; k < x-1 ; k++) {
			if (arr[k] < arr[k+1]) {
				remember = arr[k];
				arr[k] = arr[k+1];
				arr[k+1] = remember;
			}
		}
	}
	for (i = 0 ; i < x ; i++) {
		cout << arr[i] << " ";
	}
	cout << "\n";
	
return 0 ; 
}
