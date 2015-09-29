#include <iostream>
using namespace std;

int main(){
	int x;
	int y;
	int sum_odd = 0;
	cout << "Insert x:" << endl;
	cin >> x;
	cout << "Insert y (y > x):" << endl;
	cin >> y;
	while(x > y){
		cout << "Insert x:" << endl;
		cin >> x;
		cout << "Insert y (y > x):" << endl;
		cin >> y;
	}
	
	for(int count = x; count <= y; count++){
		if(count%17 == 0){
			sum_odd += count;
		}
	}
	
	cout << "The sum of numbers dividing 17 between " << x << " and " << y << " is: " << sum_odd << endl;
	return 0;
}
