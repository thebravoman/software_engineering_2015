#include <stdio.h>

int main () {
	int x, count, n, i;
	long long int arr[10];

	printf("Enter integer number x when 0<x<10: \n");
	scanf ("%d", &x);

	for (n = 0; n < 10; n++) {
		arr[n] = 0;
	}
	n = 0;

	for (i = 0; i < x*10; i++) {
		if(i%x == 0) {
			for (count = i; count > 0; count--) {
				arr[n] = arr[n] + count;
			}
			n++;
		}
	}	
	printf("\n");
	for (n = 0; n < 10; n++) {
		printf("%lld\n", arr[n]);
	}
	return 0;
}