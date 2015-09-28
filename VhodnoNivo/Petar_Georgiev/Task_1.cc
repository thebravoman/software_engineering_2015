#include <iostream>
using namespace std;

int main(){
	int x,y,count = 0;
	cin >> x;
	cin >> y;
	for (int i=x;i<y;i++){
			if (i%2){
					count+=i;	
				}
		}
	cout << "amount = " << count << endl;
	}
