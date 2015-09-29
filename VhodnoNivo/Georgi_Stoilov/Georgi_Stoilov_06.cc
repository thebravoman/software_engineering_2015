#include <iostream>
#include <stdlib.h>
using namespace std;

int main(){
	int x;
	int random;
	int arr[100];
	int firstInArray = 0;
	cout << "Insert X between 0 and 10" << endl;
	cin >> x;
	while(x <= 0 || x >= 10){
		cout << "Insert X between 0 and 10" << endl;
		cin >> x;
	}
	for(int count = 0; count < 100; count++){
		random = rand() % 100;
		arr[count] = random;
		if(arr[count] % 10 == x){
			int c = arr[firstInArray];
			arr[firstInArray] = arr[count];
			arr[count] = c;
			firstInArray++;
		}
	}
		
	for(int i = 0; i < 100; i++){
		cout << arr[i] << ",";
	}
	return 0;
}
