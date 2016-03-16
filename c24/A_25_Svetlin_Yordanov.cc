#include "iostream"

using namespace std;

void get_devisitors(int num){
	for(int i = 1; i <= num; i++){
		if(num % i == 0){
			cout << i << endl;
		}
	}
}

int main(){

	get_devisitors(160);

	return 0;
}
