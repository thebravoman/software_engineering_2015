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

int end_x (int n, int x) {
	if (n % 10 == x) {
		return 1;
	}
	return 0;
}

int main () {
	int x, i ,n;

	int arr[10];

	printf ("Enter integer\n");
	scanf ("%d", &x);

	for (i = 0; i < 10; i++) {
		arr[i] = 0;
	}
	
	i = 0;

	if(x % 2 != 0 && x != 5) {
		do {
			if (end_x(n, x) && prime(n)) {
				arr[i] = n;
				i++;
			} 
			n++;
		} while (i < 10);
	}

	for (i = 0; i < 10; i++) {
		printf ("%d\n", arr[i]);
	}
return 0;
}
