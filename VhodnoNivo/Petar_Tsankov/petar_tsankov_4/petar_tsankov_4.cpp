#include<iostream>
using namespace std;
int main() {
	int x, y;
	cin >> x >> y;
	int count;
	int countp=1;
	for (count = 1;count <=y;count+=countp) {
		countp = count - countp;
		if(count>=x) printf("%i\n", count);
	}
}