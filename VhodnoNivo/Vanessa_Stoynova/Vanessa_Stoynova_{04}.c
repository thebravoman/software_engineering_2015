#include<stdio.h>

int main () {
	int x, y, counter = 1;
	while(counter) {	
		scanf("%d %d", &x, &y);
		if(x < y) {
			counter = 0;
			break;
		}else{
			printf("Not valid x and y,\nPlease enter again\n");
		}
	}
	int a = 0 ;
	int b = 0 ; 
	int c = 1 ;
	for(counter = 0 ; counter <= y ; counter ++) {
		if(c >= x && c <= y) {
			printf("%d ", c);
		}
		a = b ;
		b = c ; 
		c = a + b ;
	}
	printf("\n");
	return 0 ;
}		
