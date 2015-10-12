#include<iostream>
using namespace std;
int main() {
	int x;
	cin >> x;
	double m[10];
	for (int i = 0;i < 10;i++) {
		m[i] = cos(i);
		printf("%f\n", m[i]);
	}
}