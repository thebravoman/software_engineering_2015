#include <stdio.h>
#define MAX 1000

int main () {
	int x, count, n, i;
	long long int arr[10];

	printf("Enter integer number x when 0<x<10: \n");
	scanf ("%d", &x);

	for (n = 0; n < 10; n++) {
		arr[n] = 0;
	}

	for (n = 0; n < 10; n++){
		for (i = 0; i < MAX; i++) {
			if(i % (x * (n+1)) == 0) {
				arr[n] = arr[n] + i;
			}
		}	
	}
	printf("\n");

	for (n = 0; n < 10; n++) {
		printf("%lld\n", arr[n]);
	}
	return 0;
}