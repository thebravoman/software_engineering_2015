#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main () {
	int arr[10];
	int arr2[5];
	int x, i;	
	time_t t;

	scanf ("%d", &x);

	srand((unsigned) time(&t));

	for (i = 0; i < 10; i++) {
		arr[i] = x + (rand() % (100 - x));	
		printf("%d - %d\n", i ,arr[i]);
	}

	i = 0;
	printf("\n");

	for (i = 0; i < 5; i++) {
		arr2[i] = arr[i*2];
		printf ("%d - %d \n", i, arr2[i]);
	}
return 0;
}
0 1 2 3 4 5 6 7 8 9
0   1   2   3   4  