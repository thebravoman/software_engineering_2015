#include <stdio.h>

int main(){
	int n = 0;
	int i = 0;
	scanf("%d", &n);
	for(i = 0; i <=n; i++){
		if(n%i==0){
			printf("%d ", i);
		}
	}
	return 0;
}
