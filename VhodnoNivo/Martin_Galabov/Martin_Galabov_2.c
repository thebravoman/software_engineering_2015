#include<stdio.h>

int main(){
	int x,y,sum;
	scanf("%d %d",&x, &y);
	if (x<y){
		for(x; x<y; x++){
			if(x%17 == 0){
				sum = sum+x;
			}
		}
		printf("%d\n", sum);
	}else{
		printf("x must be smaller than y\n");
	}

	return 0;
}
