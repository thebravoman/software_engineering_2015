#include <stdio.h>

int main () {
	int x, y, i, k;
	int count = 0;
	int simple = 0;
	int anding_three = 0;
	do {	
		printf ("Enter 2 integer numbers x and y, when x<y:\n");
		scanf ("%d", &x);
		scanf ("%d", &y);
	} while (x>y);

	for (i=x; i<=y; i++) {
		
		int simple = 0;
		int anding_three = 0;
		
		for (k=1; k<=i; k++) {
			if (i%k == 0) {
				simple++;
			}
		}

		if (simple == 2) {	
			if (i%10 == 3) {
				anding_three++;
			}
 		}

		if (simple == 2 && anding_three == 1) {
			count++;
		}

	}
	printf ("Count simple numbers ending three, is: %d\n", count);
return 0;
}
