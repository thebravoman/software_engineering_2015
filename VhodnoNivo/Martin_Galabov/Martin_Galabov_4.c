#include<stdio.h>

int main(){
	int x, y, fib1 = 1, fib2 = 1, fib3;
	scanf("%d %d",&x, &y);
	if (x<y){
		while(fib3 < y){
			fib3 = fib1 + fib2;
			fib1 = fib2;
			fib2 = fib3;
			if(fib3 > x && fib3 < y){
				printf("%d\n", fib3);
			}
		}
	}else{
		printf("x must be smaller than y\n");
	}

	return 0;
}
