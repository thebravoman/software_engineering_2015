#include <stdio.h>

int main() {

	int x, y, sum;	
	
	printf("Enter x: ");
	scanf("%d",&x);
	printf("Enter y: ");
	scanf("%d",&y);	

	if (x < y) {
		for (x++; x < y; x++) {
			if (x % 17 == 0) {
				sum += x;
			} 
		}
		printf("Sum = %d\n",sum);
	}else {
		printf("Y must be greater than X !\n");
	}

	return 0;
}
