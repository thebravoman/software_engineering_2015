#include <stdio.h>

int main() {

	int x,y;
	scanf("%d",&x);
	scanf("%d",&y);

	if (x>y) { do {
		scanf("%d",&x);
		scanf("%d",&y);
	} while(x>y);}

	int sum=0,br;
	for(br=x;br<=y;br++){
		if (br % 17 == 0) {
			sum=sum+br;
		}
	}

	printf("%d\n",sum);

	return 0;
}
