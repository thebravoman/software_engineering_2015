#include <stdio.h>

int prime (int n) {
	int j;

	for(j = 2; j <= n/2; j++) {
		if (n%j == 0) {
			return 0;
		}
	}
	return 1;
}

int main() {
	double x;
	int i = 5;
	int j = i + 2;
	double value = 0;

	printf("Enter number 0<x<1:\n");
	scanf ("%lf", &x);	

	do {
		i += 2;
		j = i + 2;
		if (prime (i)) {
			if (j + 2 == i) {
				value = 1/(double)j + 1/(double)i;
				printf("%lf\n", value);
			}
			j = i;
		}
		i++;
	} while (value > x);

	printf("%lf\n", value);
return 0;
}