#include <stdio.h>

void fibonacci (int a, int b) {

	int i , next , first = 0 , second = 1;
	for ( i = 0 ; i < b ; i++ ) {
		if ( i <= 1 ) next = i;
      		else{
         		next = first + second;
         		first = second;
         		second = next;
      		}
    	
    	if ((next>=a) && (next<=b)) printf("%d\n",next);
	}
}

int main () {

	int x, y, sum=0 ; 
	
	do {
		scanf("%d",&x);
		scanf("%d",&y);
		if(x>=y)sum=0;
		else sum=1;
	}while (!sum);
	
	fibonacci(x, y); 
	
return 0 ; 
}
