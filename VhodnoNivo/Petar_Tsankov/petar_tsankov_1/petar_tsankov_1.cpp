#include<iostream>
using namespace std;
int main() {
	int x, y;
	cin >> x >> y;
	if (x % 2 == 0) {
		x++;
	}
	int res=0;
	for (;x <= y;x += 2) {
		res += x;
	}
	printf("%i\n", res);
}