#include<stdio.h> 


int main(){ 
	int x,y,i,sum = 0;
	scanf("%d", &x); 
	scanf("%d", &y); 
	if(x>=y){ 
		printf("y must be bigger number than x\n"); 
		return 0;
	} 
	else if(y>x){
		for(i=x;i<=y;i++){
		if(i%2!=0){
			sum=sum+i;
		}
		} 
	}
	printf("%d\n", sum);
	return 0;
}
