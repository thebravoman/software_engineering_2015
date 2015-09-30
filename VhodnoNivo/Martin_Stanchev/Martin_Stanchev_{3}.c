#include <stdio.h>
int main()
{
  int x, y, i, j, not_prime = 0;

  printf("Enter x\n");
  scanf("%d", &x);
  printf("Enter y>x\n");
  scanf("%d", &y);

  for(i=x+1; i<y; ++i)
  {
      not_prime=0;
      for(j=2; j<=i/2; ++j)
      {
        if(i%j==0)
        {
	  not_prime=1;
          break;
        }
      }
      if(not_prime==0 && i % 10 == 3)
        printf("%d ",i);
  }
  return 0;
  printf("\n");
}