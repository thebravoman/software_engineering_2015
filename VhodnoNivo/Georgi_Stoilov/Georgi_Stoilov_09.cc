#include <iostream>
#include <cmath>
using namespace std;

int main(){
	int x;
	int count = 0;
	int i = 0;
	int b;
	float n;
	float arr[10];
	float original;
	bool found = false;
	cout << "Insert X between 0 and 10" << endl;
	cin >> x;
	while(x < 0 || x >= 10){
		cout << "Insert X between 0 and 10" << endl;
		cin >> x;
	}
	while(found == false){
		count++;
		n = cos(count);
		original = n;
		n = n * 1000;
		b = n;
		if(b % 10 == x){
			arr[i] = original;
			i++;
		}
		if(i == 10){
			found = true;
		}
	}
	
	for(i = 0; i < 10; i++){
		cout << arr[i] << endl;
	}
	
	cout << "" << endl;
	return 0;
}
