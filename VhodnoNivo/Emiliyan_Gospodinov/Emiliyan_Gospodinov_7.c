#include<stdio.h>

int main(){
	int x,i,j;
	int arr[10], sec[5];
	scanf("%d", &x);
	if((x<0)||(x>=100)){
		printf("0<x<100");
		return 0;
	} else {
		for(i=0;i<10;i++){		
			scanf("%d", &arr[i]);
			if(arr[i]<x){
				printf("elements from array must be bigger than x: %d\n",x);
			}
		}
		for(i=1,j=0;i<=10,j<5;i=i+2,j++){
				sec[j]=arr[i];
		}
	
	}
	for(j=0;j<5;j++){
		printf("%d ", sec[j]);
	}
	printf("\n");
	return 0;
}
