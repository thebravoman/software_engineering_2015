#include <stdio.h>
#include <math.h>

int main () {
	int x, i, k;
	double arr[10], swap;
	printf ("Enter integer\n");
	scanf ("%d", &x);

	for (i=0; i<=10; i++) {
		arr[i] = cos(i);
		printf ("%lf\n", arr[i]);
	}

	for (i = 0; i < 9 ; i++) {
		for (k = 1; k < 10 ; k++) {
			if (arr[k] < arr[k+1]) {
				swap = arr[k];
				arr[k] = arr[k+1];	
				arr[k+1] = swap;
			}
		}
	}
	printf("\n");
	printf("\n");
	printf("\n");

	for (i = 0; i <= 9; i++) {
		printf ("%lf\n", arr[i]);
	}
return 0;	
}

