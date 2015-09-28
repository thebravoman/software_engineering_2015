#include<iostream>
using namespace std;
void swap(int*i1, int*i2) {
	int i=*i1;
	*i1 = *i2;
	*i2 = i;
}
int main() {
	int x;
	cin >> x;
	int m[100];
	for (int i = 0;i < 100;i++) {
		m[i] = rand();
	}
	int c=0;
	for (int i = 0;i < 100;i++) {
		if (m[i] % 10 == x) {
			swap(&m[i], &m[c]);
			c++;
		}
	}
	for (int i = 0;i < 100;i++) {
		printf("%i\n",m[i]);
	}
}