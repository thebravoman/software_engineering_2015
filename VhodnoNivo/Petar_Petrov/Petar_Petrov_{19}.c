#include<stdio.h>

double SumOfReciprocalPrimes(float);

int main()
{
    float x;
    
    do
    {
        printf("Please input a fraction between 0 and 1:\n");
        scanf("%f",&x);
    } while(x <= 0 || x >= 1);
    
    printf("%lf\n",SumOfReciprocalPrimes(x));
    
    return 0;
}

double SumOfReciprocalPrimes(float x)
{
    int prime_1 = 0, prime_2 = 0, divider = 2;
    double reciprocal_sum = 0;
    
    do
    {
        while(prime_1 < divider)
        {
            prime_1++;
        }
        while(prime_1 % divider != 0)
        {
            divider++;
        }
        if(prime_1 == divider)
        {
            prime_2 = prime_1 + 2;
            divider = 2;
            while(prime_2 % divider != 0)
            {
                divider++;
            }
            if(prime_2 == divider)
            {
                reciprocal_sum += (double) 1/prime_1 + (double) 1/prime_2;
            }
        }
        divider = 2;
        prime_1++;
    } while(reciprocal_sum == 0 || (double) 1/prime_1 + (double) 1/prime_2 >= x);

    return reciprocal_sum;
}
