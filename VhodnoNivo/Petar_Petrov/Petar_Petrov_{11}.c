#include<stdio.h>

double Pi(double);

int main()
{
    double x;
    
    do
    {
        printf("Please input a fraction between 0 and 1:\n");
        scanf("%lf",&x);
    } while(x <= 0 || x >= 1);
    
    printf("%lf\n",Pi(x));
    
    return 0;
}

double Pi(double x)
{
    int addition_switcher, denominator = 3;
    double pi, pi_expression = (double) 4/denominator;
    for(addition_switcher = 1, denominator = 1, pi = 0; (double) 4/denominator >= x; denominator += 2)
    {
        if(addition_switcher == 1)
        {
            pi += (double) 4/denominator;
            addition_switcher = 0;
        }
        else
        {
            pi -= (double) 4/denominator;
            addition_switcher = 1;
        }
    }
    
    return pi;
}
