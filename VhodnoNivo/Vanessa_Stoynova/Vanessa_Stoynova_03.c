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
	int count ;
	for(counter = x ; counter <= y ; counter ++) {
		 if(counter % 10  == 3 ) {
		 	for(count = 2 ; count <= counter ; count ++) {
		 		if(counter % count == 0) {
		 			break ;
		 		}
		 	}			
		 }
		 if(count == counter) {
		 	printf("%d ", counter);
		 }
	}	
	printf("\n");
	return 0;
}
