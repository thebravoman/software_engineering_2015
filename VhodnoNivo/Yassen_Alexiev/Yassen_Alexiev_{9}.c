#include <stdio.h>
#include <math.h>

int main () {
	int x,i,thrid_num;

	double arr[x];
	int arr2[x];
	printf ("Enter integer\n");
	scanf ("%d", &x);

	for (i=0; i<=arr[x]; i++) {
		thrid_num = 0;
		arr[i] = cos(i);
		if(arr[i] < 0) {
			arr[i] =arr[i] * -1;
		}

		thrid_num = arr[i]*1000;
		thrid_num = thrid_num %10;
		arr2[i] = thrid_num;	
		printf ("%d", arr2[i]);
	}
	
	
return 0;	
}
