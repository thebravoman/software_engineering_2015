#include<iostream>
using namespace std;
int main() {
	int x, y;
	cin >> x >> y;
	for (;x%17 != 0;x++) {
	}
	int res = 0;
	for (;x <= y;x += 17) {
		res += x;
	}
	printf("%i\n", res);
}