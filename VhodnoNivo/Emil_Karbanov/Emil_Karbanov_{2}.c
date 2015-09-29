#include<stdio.h>
int main(){
	int x,y,num;
	int s = 0;
	scanf("%d",&x);
	scanf("%d",&y);
	if (x > y){
	printf("Input new x");
	scanf("%d",&x);
	}
	for(num = x; num <= y; num++)
	{
		if(num % 17 == 0)
		{
			s = s + num;	
		}

	}
	printf("%d",s);

return 0;		
}
