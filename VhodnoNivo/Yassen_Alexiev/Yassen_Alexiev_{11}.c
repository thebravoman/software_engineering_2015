#include <stdio.h>

int main() {
	double x, pi;
	int i, znak;

	printf("Enter number 0<x<1:\n");
	scanf ("%lf", &x);	

	pi = 4.0;
	znak = 1;
	double n = 3.0;
	 while(true) {
	 	if (znak%2 == 0) {
	 		pi = pi + (4.0/n);
	 	}

	 	else {
	 		pi = pi - (4.0/n);
	 	}
	 	n++;
	 	znak++;

	 	if (4.0/n < x) {
	 		break;
	 	}
	 } 

	 printf("Pi is: %lf\n", pi);

return 0;
}