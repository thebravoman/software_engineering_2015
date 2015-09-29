#include <stdio.h>

int main() {
	int x=1, y=0, sum, i;
	while(x>y) {
		printf("Enter x and y (y>x!)\n");
		scanf("%d %d", &x, &y);
	}
	for(i=x; i<=y; i++){
		if(i%2!=0){
			sum=sum+i;	
		}
	}
	printf("%d\n", i);

	return 0;
}
