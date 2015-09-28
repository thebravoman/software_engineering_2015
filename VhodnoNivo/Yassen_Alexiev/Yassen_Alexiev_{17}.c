#include <stdio.h>

int main () {
	int x, i;

	long long int arr[10];

	printf ("Enter integer\n");
	scanf ("%d", &x);

	long long int num_1 = 1;
	long long int num_2 = 1;
	long long int num_3 = 0;

	i = 0;

	do {
		num_3 = num_2 + num_1;
		num_1 = num_2;
		num_2 = num_3;

		if (num_1 % 10 == x) {
			arr[i] = num_1;
			i++;
		}
	} while (i < 10);
	
	for (i=0; i < 10; i++) {
		printf ("%lld\n", arr[i]);
	}
return 0;
}
