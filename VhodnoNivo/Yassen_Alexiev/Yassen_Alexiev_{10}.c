#include <stdio.h>

int main () {
	int x,i, count;

	int arr[10];

	printf ("Enter integer\n");
	scanf ("%d", &x);

	int num_1 = 1;
	int num_2 = 1;
	int num_3 = 0;
	i=0;
	count = 0;
	do {
		num_3 = num_2 + num_1;
		num_1 = num_2;
		num_2 = num_3;

		count = num_1%x;

		if (count == 0) {
			arr[i] = num_1;
			i++;
		}
		count = 0;
	} while (i<=10);
	
	for (i=0; i<=arr[10]; i++) {
		printf ("%d\n", arr[i]);
	}
return 0;
}
