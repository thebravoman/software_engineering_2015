#include <stdio.h>

int main () {
	int x, y, i;
	int count = 0;
	do {	
		printf ("Enter 2 integer numbers x and y, when x<y:\n");
		scanf ("%d", &x);
		scanf ("%d", &y);
	} while (x>y);
	
	for (i=x; i<=y; i++) {
		if (i%2 == 1) {
			count++;
		}
	}

	printf ("Count odd numbers is: %d", count);
return 0;
}
