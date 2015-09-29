#include<stdio.h>

int main () {

	int x,y,sum=0;
	
	do{
		scanf("%d",&x);
		scanf("%d",&y);
		if(x>=y) sum=1;
		else sum =0;
	}while(sum);

	sum=0;

	for(x ; x<=y ; x++) {
		if ((x % 17) == 0) sum += x;
	}

	printf("The sum is :  %d\n",sum);

return 0 ; 
}
