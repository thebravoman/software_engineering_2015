#include <iostream>
using namespace std;

int main(){
	int x;
	bool isTrue = true;
	int primeCounter;
	int arr[10];
	int ct = 0;
	int i = 2;
	cout << "Insert x:" << endl;
	cin >> x;
	while(x <= 0 || x >= 10){
		cout << "Insert x:" << endl;
		cin >> x;
	}
	if(x == 2 || x == 4 || x == 5 || x == 6 || x == 8){
		cout << "There aren't any prime numbers" << endl;
		return 0;
	}
	while(ct != 10){
		while(isTrue == true){
			primeCounter = 0;
			i++;
			for(int count = 1; count <= i; count++){
				if(i % count == 0){
					primeCounter++;	
				}
			}
			if(primeCounter == 2){
				if(i % 10 == x){
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
