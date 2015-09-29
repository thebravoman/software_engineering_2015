#include <iostream>
#include <cmath>
using namespace std;

int main(){
	int x;
	int count = 0;
	int i = 0;
	int sum = 0;
	bool isTrue = true;
	int arr[10];
	cout << "Insert X between 0 and 10" << endl;
	cin >> x;
	while(x <= 0 || x >= 10){
		cout << "Insert X between 0 and 10" << endl;
		cin >> x;
	}
	while(count != 10){
		while(isTrue == true){
			i++;
			if(i % x == 0){
				for(int ct = 0; ct < i; ct++){
					sum += ct;
				}
				arr[count] = sum;
				sum = 0;
				count++;
				isTrue = false;
			}
		}
		isTrue = true;
	}
	
	for(i = 0; i < 10; i++){
		cout << arr[i] << ", ";
	}
	cout << "" << endl;
	return 0;
}
