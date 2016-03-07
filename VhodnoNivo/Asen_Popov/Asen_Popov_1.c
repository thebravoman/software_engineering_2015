#include <stdio.h>

int main() {

	int x,y;
	scanf("%d",&x);
	scanf("%d",&y);

	do {
		scanf("%d",&x);
		scanf("%d",&y);
	} while(x>y);

	int sum=0,br;
	for(br=x;br<=y;br++){
		if (br % 2 != 0) {
			sum=sum+br;
		}
	}

	printf("%d\n",sum);

	return 0;
}
