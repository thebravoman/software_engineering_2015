#include<iostream>
using namespace std;
int main() {
	int x;
	cin >> x;
	unsigned int m[10];
	for (int i = 0;i < 10;i++) {
		m[i] = rand() + x + 2;
	}
	int size_a = 0;
	unsigned int a[10];
	for (int i = 0;i < 10;i++) {
		if (m[i] % 2 != 0) {
			a[size_a] = m[i];
			size_a++;
		}
	}
	for (int i = 0;i < size_a;i++) {
		printf("%u\n", a[i]);
	}
}