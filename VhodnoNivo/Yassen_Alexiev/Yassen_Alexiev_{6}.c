#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main () {
	int x, i, j, arr[100];
	int swap = 0;
	time_t t;

	printf ("Enter integer\n");
	scanf ("%d", &x);

	srand(time(0));

	for (i=0; i<=arr[100]; i++) {
		arr[i] = rand() % 99 + 1;	
	}
	
	for (i=0; i<=arr[100]; i++) {
		if (arr[i] % 10 == x) {
			for (j = 0; arr[j] % 10 != x ; j++) {
				swap = arr[i];
				arr[i] = arr[j];
				arr[j] = swap;
			}
		}
	}
	
	for (i=0; i <= 100; i++) {
		printf ("%d. %d\n", i, arr[i]);	
	}
	
return 0;
}
