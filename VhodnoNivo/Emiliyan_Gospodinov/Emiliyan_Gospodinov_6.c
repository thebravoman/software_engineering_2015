#include<stdio.h>

int main(){
	int x,i;
	int arr[100];
	scanf("%d", &x);
	if((x<0)||(x>=10)){
		printf("0<x<10");
		return 0;

	} else {
		for(i=0;i<100;i++){		
			scanf("%d", &arr[i]);
		}
		for(i=0;i<100; i++){
			if((arr[i]-x)%10==0){
				printf("%d ", arr[i]);
			}
		}
		for(i=0;i<100; i++){
			if((arr[i]-x)%10!=0){
				printf("%d ", arr[i]);
			}
		}	
	}
	printf("\n");




	return 0;
}
