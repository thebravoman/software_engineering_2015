#include <iostream>
#include <cmath>
using namespace std;

int main(){
	int x;
	float arr[10];
	bool isOrder = false;
	bool isSorted = false;
	cout << "Insert X between 0 and 10" << endl;
	cin >> x;
	while(x <= 0 || x >= 10){
		cout << "Insert X between 0 and 10" << endl;
		cin >> x;
	}
	for(int count = 0; count < 10; count++){
		arr[count] = cos(count);
		cout << arr[count] << ", ";
	}
	while(isOrder == false){
		int a = 0;
		for(int count = 0; count < 10; count++){
			if(arr[count] < arr[count+1]  ){
				float c = arr[count+1];
				arr[count+1] = arr[count];
				arr[count] = c;
				isSorted = false;
			}else{
				a++;
				if(a == 10){
					isSorted = true;					
				}
			}
		}
		if(isSorted == true){
			isOrder = true;
			arr[5] = 0;
		}else {
			isOrder = false;
		}
		
	}
	cout << "" << endl;
	cout << "Sorted: " ;
	for(int count = 0; count < 11; count++){
		cout<< arr[count] << ", ";
	}
	cout << "" << endl;
	return 0;
}
