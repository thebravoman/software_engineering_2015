#include <iostream>
using namespace std;

int main(){
	int x;
	int arr[10];
	int arr2[5];
	int counter = 0;
	cout << "Insert X between 0 and 100" << endl;
	cin >> x;
	while(x <= 0 || x >= 100){
		cout << "Insert X between 0 and 100" << endl;
		cin >> x;
	}
	
	for(int count = 0; count < 10; count++){
		cout << "Insert number in the array bigger than " << x << ": ";
		cin >> arr[count];
		cout << "" << endl;
		while(arr[count] <= x){
			cout << "Insert number in the array bigger than!!!!! " << x << ": ";
			cin >> arr[count];
			cout << "" << endl;
		}
	}
	
	for(int i = 0; i < 10; i++){
		if(i % 2 == 0){
			arr2[counter] = arr[i];
			counter++;
		}
	}
	
	for(int i = 0; i < 5; i++){
		cout << arr2[i] << ", ";
	}
	return 0;
}
