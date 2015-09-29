#include<stdio.h> 


int main(){ 
	int x,y,sum = 0,pr, count1,count2;
	scanf("%d", &x); 
	scanf("%d", &y); 
	if(x>=y){ 
		printf("y must be bigger number than x\n"); 
		return 0;
	} 
	else if(y>x){
			for(count1=x+1; count1<y; count1++){
				pr=0;
				for(count2=2; count2<=count1/2; count2++){
        				if(count1%count2==0){
            					pr=1;
            					break;
         				}
      				}
				if((pr==0)&&((count1-3)%10==0))
					sum=sum + count1;
			}
	}
	printf("%d\n", sum);
	return 0;
}
