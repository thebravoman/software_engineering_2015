#include <iostream>
using namespace std;

void printDevisitors(int num) {
	for(int i=2, q=1; i<num; i++) {
		if(num % i == 0) cout << q++ << ": " << i << endl;
	}
}

int main() {
	int num;
	cout << "Enter number: ";
	cin >> num;
	cout << "Devisitors:" << endl;
	printDevisitors(num);
	return 0;
}