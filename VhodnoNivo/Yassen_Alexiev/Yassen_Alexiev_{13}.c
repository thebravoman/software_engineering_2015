#include <stdio.h>
#include <math.h>

int main() {
		int x;
			printf("Enter integer number x when 0<x<10: \n");
			scanf ("%d", &x);

		double arr[10];
		
		int i, j, second_x;
		second_x = 0;
		for (j = 0; j < 10; j++) {
			double value = 0.0;
			if (j == 0) {
				for (i = 0; i < x; i++) {
					x = second_x;
					second_x = (j + 1) * x;
					value =+ cos(i);
				}
			}

			if (j > 0) {
				for (i = x; i < second_x; i++) {
					x = second_x;
					second_x = (j + 1) * x;
					value =+ cos(i);
				}
			}
			arr[j] = value;
		}

		for (j = 0; j < 10; j++) {
			printf("%lf\n", arr[j]);
		}
return 0;
}