#include<iostream>
using namespace std;
int main() {
	int x, y;
	cin >> x >> y;
	for (;x % 10 != 3;x++) {
	}
	for (;x <= y;x +=10) {
	printf("%i\n", x);
	}
}