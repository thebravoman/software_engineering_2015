#include <iostream>
#include <cmath>
using namespace std;

int main(){
	int x;
	int count = 0;
	int i;
	int b = 0;
	int times = 1;
	float sum = 0;
	double arr[10];
	cout << "Insert X between 0 and 10" << endl;
	cin >> x;
	while(x <= 0 || x >= 10){
		cout << "Insert X between 0 and 10" << endl;
		cin >> x;
	}
	while(count != 10){
		for(i = b; i < x*times; i++){
			sum = sum + cos(i);
			b++;
		}
		arr[count] = sum;
		times++;
		count++;
		sum = 0;
	}
	
	for(i = 0; i < 10; i++){
		cout << arr[i] << ", ";
	}
	cout << " " << endl;
	
	return 0;
}
