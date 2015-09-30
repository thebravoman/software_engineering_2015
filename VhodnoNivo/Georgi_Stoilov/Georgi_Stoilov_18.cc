#include <iostream>
using namespace std;

int main(){
	int x;
	bool isTrue = true;
	int primeCounter;
	int arr[10];
	int ct = 0;
	int i = 0;
	cout << "Insert x:" << endl;
	cin >> x;
	while(x < 0){
		cout << "Insert x:" << endl;
		cin >> x;
	}
	if(x % 2 == 0){
		cout << "There aren't any odd numbers" << endl;
		return 0;
	}
	while(ct != 10){
		while(isTrue == true){
			primeCounter = 0;
			i++;
			if(i % 2 != 0){
				if(i % x == 0){
					arr[ct] = i;
					ct++;
					isTrue = false;
				}	
			}			
		}
		isTrue = true;
	}
	
	for(int count = 0; count < 10; count++){
		cout << arr[count] << ", ";
	}
	cout << "" << endl;
	return 0;
}
