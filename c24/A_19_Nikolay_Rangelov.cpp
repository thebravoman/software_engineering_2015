#include <iostream>

using namespace std;

int main(){
	int n = 0;
	cin >> n;
	for(int i = 0; i <=n; i++){
		if(n%i==0){
			cout << i << endl; 
		}
	}
	return 0;
}
