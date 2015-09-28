#include <stdio.h>
#include <math.h>

int is_prime (int num) {
	int i ,yes =0 ; 
	if(num > 1) {
		if ((((num % 2)== 0) && (num != 2))) return 0 ;
		else {
			for (i=3; i<=sqrt(num) ; i++) {
				if ((num % i) == 0) {
					yes=1;
					break;
				}else yes=0;
			}
			if (yes == 0) return 1;
			else return 0;
		}
	}else return 0;
	
return 0 ;
}

int is_lastnum_equals_3 (int num) {
	if (num % 10 == 3) {
		return 1;
	}
	
return 0 ; 

}


int main () {
	
	int x, y, i=0, sum=0 ;
	
	do {
		scanf("%d",&x);
		scanf("%d",&y);
		if(x>=y)sum=0;
		else sum=1;
	}while (!sum);
	
	for (x ; x <= y ; x++) {
		if ((is_prime(x)) && (is_lastnum_equals_3(x))) printf ("\t%d\n ", x);
	}
	
return 0 ; 
}
