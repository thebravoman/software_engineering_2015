#include <iostream>
using namespace std;

int main(){
	int x, y, w, h;
	int arr[10];
	cout << "Insert X: " << endl;
	cin >> x;
	while(x <= 0){
		cout << "Insert X bigger than 0: " << endl;
		cin >> x;
	}
	cout << "Insert Y:" << endl;
	cin >> y;
	while(y <= 0){
		cout << "Insert Y bigger than 0: " << endl;
		cin >> y;
	}
	cout << "Insert W:" << endl;
	cin >> w;
	while(w <= 0){
		cout << "Insert W bigger than 0: " << endl;
		cin >> w;
	}
	cout << "Insert H:" << endl;
	cin >> h;
	while(h <= 0){
		cout << "Insert H bigger than 0: " << endl;
		cin >> h;
	}
	
	int block_x = x / w;
	int block_y = y / h;
	int block_parts = block_x * block_y;
	int e = x - w;
	for(int count = 0; count < block_x; count++){
		arr[count] = e;
		e -= w;
	}
	cout<< "Parts: " << block_parts << endl; 
	for(int count = 0; count < block_x; count++){
		cout << arr[count] << ", ";
	}
	cout << " " << endl;
 	return 0;
}
