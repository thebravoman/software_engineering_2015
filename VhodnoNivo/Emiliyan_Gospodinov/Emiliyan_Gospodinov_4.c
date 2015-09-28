#include<stdio.h> 


int main(){ 
	int x,y,i;
	int next=0, first=0, second=1;
	scanf("%d", &x); 
	scanf("%d", &y);
	if(x>=y){ 
		printf("y must be bigger number than x\n"); 
		return 0;
	} 
	else if(y>x){
		 for (i=0;next<y;i++){
			if (i<=1)
				next = i;
			else{
			         next = first + second;
			         first = second;
			         second = next;
			}
			if((next>=x)&&(next<=y)){
			printf("%d\n",next);
			}
		}
	}
	return 0;
}
