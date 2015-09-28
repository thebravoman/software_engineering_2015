#include <iostream>
using namespace std;

int main(){
	int x;
	int y;
	int primeCounter;
	cout << "Insert x:" << endl;
	cin >> x;
	cout << "Insert y (y > x):" << endl;
	cin >> y;
	while(x > y){
		cout << "Insert x:" << endl;
		cin >> x;
		cout << "Insert y (y > x):" << endl;
		cin >> y;
	}
	for(int count = x; count <= y; count++){
		primeCounter = 0;
		for(int i = 1; i <= y; i++){
			if(count % i == 0){
				primeCounter++;
			}
		}
		if(primeCounter == 2){
			if(count % 10 == 3){
				cout << "Prime number: "<< count << endl;
			}
		}
	}
	return 0;
}
