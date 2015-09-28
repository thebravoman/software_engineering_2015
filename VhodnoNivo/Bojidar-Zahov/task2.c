#include<stdio.h>

int main(){
	int x,y,sum = 0;
	do {	
		printf("Write x and y: \n");		
		scanf(" %d %d", &x , &y);
	}while (!( x < y ));
	
	for(x; x <= y;x = x + 1) {
			
		if ( (x % 17) == 0){
			sum = sum + x;
			//printf("1 : %d\n",sum);
			//printf("x: %d\n", x);
		} 
	
	}
printf("%d\n",sum);
return 0;
}
