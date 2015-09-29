#include <iostream>
using namespace std;

int main(){
	int x;
	long long unsigned arr[10];
	int i=0;
	long long unsigned fib[1000];
	int count = 0;
	bool isReady = false;
	fib[0] = 1;
	fib[1] = 1;
	cout << "Insert X between 0 and 10" << endl;
	cin >> x;
	while(x < 0 || x >= 10){
		cout << "Insert X between 0 and 10" << endl;
		cin >> x;
	}
	while(isReady == false){
		count++;
		fib[count] = fib[count-1] + fib[count-2];
		if(fib[count] % x == 0){
			arr[i] = fib[count];
			i++;
		}
		if(i == 10){
			isReady = true;
		}
	}
	cout << "First 10 fibonacci numbers divided to "<< x <<": ";
	for(i = 0; i < 10; i++){
		cout << arr[i] << ", ";
	}
	cout << "" << endl;
	return 0;
}
