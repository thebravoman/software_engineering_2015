#include <stdio.h>
#include <math.h>

int main()
{
	int ctr1, ctr2;
	double x, min = 0, tmp = 0;
	double cosnums[10];

	while (x <= 0 || x >= 10)
	{
		printf("Enter X:");
		scanf("%lf", &x);
		if (x <= 0 || x >= 10)
		{
			printf("X must be more than 0 and less than 10!!!");
		}
	}
	for (ctr1 = 0; ctr1 < 10; ctr1++)
	{
		cosnums[ctr1] = cos(ctr1);
		printf("%.0001f ", cosnums[ctr1]);
	}
	printf("\n");

	for(ctr1 = 0; ctr1 < 10; ctr1++)
		for(ctr2 = ctr1; ctr2 < 10; ctr2++)
				if(cosnums[ctr1] < cosnums[ctr2])
				{
					tmp = cosnums[ctr1];
					cosnums[ctr1] = cosnums[ctr2];
					cosnums[ctr2] = tmp;
				}
    for (ctr1 = 0; ctr1 < 10; ctr1++)
	{
		printf("%.0001f ", cosnums[ctr1]);
	}
	printf("\n");
	return 0;
}