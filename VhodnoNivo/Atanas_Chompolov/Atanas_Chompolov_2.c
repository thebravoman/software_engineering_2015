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
		printf("Sum of numbers between x&y: %d\n",sum);
	}else {
		printf("X must be < than Y\n");
	}

	return 0;
}
