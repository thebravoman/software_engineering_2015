#include<stdio.h>

int main(){
	
	int arr[10], arr2[5], i, a,b;
	int x;
	scanf("%d", &x);
	if (x> 0 && x<100){
		for(a = 1; a<=10; a++){
		for(i; i<=110; i++){
		if(i >x){
			arr[a] = i;
			if(a%2 == 0){
			arr2[b] = arr[a];
			}
		}
		i++;
		}
	}
	
	return 0;
}
