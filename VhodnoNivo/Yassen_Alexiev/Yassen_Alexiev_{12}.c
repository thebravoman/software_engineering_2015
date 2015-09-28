#include <stdio.h>

int main () {
	int x, y, w, h;

	printf("Enter 4 numbers when x>0, y>0, w>0, h>0\n");
	scanf ("%d", &x);
	scanf ("%d", &y);
	scanf ("%d", &w);
	scanf ("%d", &h);

	if (x<w || x<h || y<w || y<h) {
		printf("Must cut into 0 pieces\n");
		return 0;;
	}
	
	int max, max_1;
	int initialisation = 0;

	if (x%w > x%h) { // 200%30 = 20 > 200%40 = 0
		max = x/h; //max = 200/40 = 5
		initialisation = h;
	}

	if (x%w < x%h) { // 200%30 = 20 < 200%40 = 0
		max = x/w; //max = 200/30 = 6
		initialisation = w;
	}

	if (x%w == x%h) { // 200%30 = 20 == 200%40 = 0
		max = x/w; //max = 200/30 = 6
		initialisation = w; 
	}

	int initialisation_1 = 0;
	if (y%w > y%h) { // 120%30 = 0 > 120%40 = 0
		max_1 = y/h; //max_1 = 120/40 = 3
		initialisation_1 = h;
	}

	if (y%w < y%h) { // 120%30 = 0 < 120%40 = 0
		max_1 = y/w; //max_1 = 120/40 = 3
		initialisation_1 = w;
	}

	if (y%w == y%h) { // 120%30 = 0 == 120%40 = 0
		max_1 = y/w; //max_1 = 120/30 = 4
		initialisation_1 = w;
	}
	printf("Must cut into: %d pieces\n", max * max_1);

	int i;
	int arr[10];
	int count = 0;
	if (x>=y) {
		for (i = 0; i <= max; i++) {
			arr[i] = i*initialisation;
			count = max;
		}
	}

	if (x<y) {
		for (i = 0; i <= max_1; i++) {
			arr[i]  = i*initialisation_1;
			count = max_1;
		}
	}

	for (i = 0; i <= count; i++) {
		printf("We need to cut on:");
		printf ("%d\n", arr[i]);
	}
	return 0;	
}