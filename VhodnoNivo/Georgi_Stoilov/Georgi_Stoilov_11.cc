#include <iostream>
using namespace std;

int main(){
	float x;
	float pi;
	float y;
	float number = 0;
	int i=1;
	float n = 3;
	bool isReady = false;
	number = number + (-(4/n) + 4/(n+2));
	cout << "Insert X between 0 and 1" << endl;
	cin >> x;
	while(x <= 0 || x >= 1){
		cout << "Insert X between 0 and 1" << endl;
		cin >> x;
	}
	
	while(isReady == false){
		if(i % 2 == 0){
			number = number + (4/n);
			n+=2;
			y = 4/n;			
			if(y < x){
				isReady = true;
			}
			i++;
		}else{
			number = number - (4/n);
			y = 4/n;
			n+=2;
			if(y < x){
				isReady = true;
			}
			i++;
		}
	}
	
	pi = 4 + number;
	cout << "Pi = " << pi << endl;
	return 0;	
}
