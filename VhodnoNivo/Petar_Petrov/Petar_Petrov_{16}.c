#include<stdio.h>

void PrimesEndingWithX(int*,int);

int main()
{
    int x;
    int array[10];
    
    do
    {
        printf("Please input a whole number between 0 and 10:\n");
        scanf("%d",&x);
    } while(x <= 0 || x >= 10);
    PrimesEndingWithX(array,x);
    
    return 0;
}

void PrimesEndingWithX(int arr[10], int x)
{
    int num_count, arr_count, divider = 2;

    for(arr_count = 0, num_count = 0; arr_count < 10; num_count++)
    {
       
       while(num_count < divider)
       {
         num_count++;
       }
       while(num_count % divider != 0)
       {
         divider++;
       }
       if(num_count == divider && num_count % 10 == x)
       {
         arr[arr_count] = num_count;
         printf("%d\n",arr[arr_count]);
         arr_count++;
       }
       else if(x % 2 == 0 || (x == 5 && num_count > x))
       {
         if(x == 2)
         {
            printf("There are no more primes ending with %d\n",x);
         }
         else
         {
            printf("There are no primes ending with %d\n",x);
         }
         break;
       }
       divider = 2;
    }
    
    return;
}
