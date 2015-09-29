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

int main () {
	int x, i;
	int count = 0;

	long long int arr[10];
	long long int arr2[10];

	printf ("Enter prime number\n");
	scanf ("%d", &x);

	for (i = 0; i < 10; i++) {
		arr[i] = 0;
		arr2[i] = 0;
	}
	
	for (i = 1; i <= x; i+=2) {
		if (x % i == 0) {
			arr[count] = i;
			if (prime (i)) {
				arr2[count] = i;
			}
			count++;
		}
	}

	for (count = 0; count < 10; count++) {
		if (arr[count] == 0) {
			break;
		}
		printf("%lld\n", arr[count]);
	
		if (arr2[count]) {
			printf(" it's prime \n");
		}
	printf("\n");
	}

	return 0;
}