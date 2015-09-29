#include <stdio.h>

int main () {
	int x, y, i, count;
	do {	
		printf ("Enter 2 integer numbers x and y, when x<y:\n");
		scanf ("%d", &x);
		scanf ("%d", &y);
	} while (x>y);
	
	int num_1 = 0;
	int num_2 = 0;
	int num_3 = 1;
	
	for (i=1; i<=y; i++){
			
			if (i >= x) {
				printf ("%d\n", num_3);
			}
			//printf("%d, %d, %d\n", num_1, num_2, num_3);

			num_1 = num_2;
			num_2 = num_3;
			num_3 = num_1 + num_2;	
	}
	
return 0;
}
