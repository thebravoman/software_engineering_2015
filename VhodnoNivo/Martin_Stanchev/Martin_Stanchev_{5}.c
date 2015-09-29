#include <stdio.h>
#include <math.h>

int cmp(const void *x, const void *y);

int main()
{
  double str[10];
  int x;
  int i = 0;
  double ind = 1;

  printf("Enter 0<X>10");
  scanf("%d", &x);
  
  printf("unsorted: ");
  for(i = 0; i <= 10; i++){
    ind = i;
    str[i] = cos(ind);
    printf("%f ", str[i]);
  }
  printf("\n");
  
  printf("sorted: ");
  qsort(str, sizeof(str)/sizeof(str[0]), sizeof(str[0]), cmp);
  for(i = 0; i <= 10; i++) {
    printf("%f ", str[i]);
  }
  printf("\n");
  return 0;
}

int cmp(const void *x, const void *y)
{
  double xx = *(double*)x, yy = *(double*)y;
  if (xx > yy) return -1;
  if (xx < yy) return  1;
  return 0;
}