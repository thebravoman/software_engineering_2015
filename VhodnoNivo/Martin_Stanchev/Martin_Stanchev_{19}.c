#include <stdio.h>

int prime_check(int a);

int main() {
  double x;
  int fnum = 3, snum = 5;
  double sum = 0;
  int j, num_is_prime = 1;
  
  printf("Enter X \n");
  scanf("%lf", &x);
  
  sum = (1/(double)fnum) + (1/(double)snum);
  
  do{
    if(prime_check(fnum) == 1 && prime_check(snum) == 1){
      sum = (1/(double)fnum) + (1/(double)snum);
      fnum += 2;
      snum = fnum + 2;
      printf("%lf ", sum);
    }
  } while(sum >= x);
  
}

int prime_check(int a)
{
    int is_prime = 0;
    int i;
    
    for(i = 2; i < a; i++)
    {
        if(a % i == 0)
            is_prime = 1;
    }

    if(is_prime = 1) return 1;
    else return 0;

}
