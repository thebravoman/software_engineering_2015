#include <iostream>
using namespace std;

int main(){
	int x;
	int y;
	int fib[1000];
	fib[0] = 1;
	fib[1] = 1;
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
	for(int count = 2; count <= y; count++){
		fib[count] = fib[count-1] + fib[count-2];
		if(fib[count] >= x && fib[count] <= y){
			cout << "Fibonacci number: "<< fib[count] << endl;
		}
	}
	return 0;
}
