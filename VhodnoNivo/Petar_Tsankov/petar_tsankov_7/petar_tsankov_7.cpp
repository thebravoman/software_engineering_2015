#include<iostream>
using namespace std;
int main() {
	int x;
	cin >> x;
	unsigned int m[10];
	for (int i = 0;i < 10;i++) {
		m[i] = rand()+x+1;
	}
	unsigned int a[5];
	for (int i = 0;i < 10;i+= 2) {
		a[i / 2] = m[i];
	}
	for (int i = 0;i < 5;i++) {
		printf("%i\n", a[i]);
	}
}