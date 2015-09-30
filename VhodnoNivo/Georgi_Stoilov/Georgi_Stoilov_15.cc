#include <iostream>
#include <cmath>
using namespace std;

int main(){
	int x;
	int count = 0;
	int times = 1;
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
		for(int i = 0; i < 1000; i++){
			if(i % (x*times) == 0){
				sum = sum + i;
			}
		}
		arr[count] = sum;
		sum = 0;
		count++;
		times++;
	}
	
	for(int i = 0; i < 10; i++){
		cout << arr[i] << ", ";
	}
	cout << "" << endl;
	return 0;
}
