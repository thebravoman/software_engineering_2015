#include<stdio.h>

int FindOddNumDivByX(int*,int);
void FindPrimesDivByX(int*,int);

int main()
{
    int x;
    int array[10];
    
    do
    {
        printf("Please input any positive whole number:\n");
        scanf("%d",&x);
    } while(x <= 0);
    if(!FindOddNumDivByX(array,x))
    {
        printf("\n");
        FindPrimesDivByX(array,x);
        
    }
    else
    {
        printf("Odd numbers can't be divided by %d\n",x);
    }
    
    return 0;
}   

int FindOddNumDivByX(int arr[10], int x)
{
    int arr_count, num_count;
    
    for(arr_count = 0, num_count = 0; arr_count < 10; arr_count++, num_count++)
    {
        if(num_count == 0)
        {
            num_count++;
        }
        if(x % 2 == 0)
        {
            return 1;
        }
        else
        {
            while(num_count % 2 == 0 || num_count % x != 0)
            {
                num_count++;
            }
            arr[arr_count] = num_count;
            printf("%d\n",arr[arr_count]);
        }
    }

    return 0;
}

void FindPrimesDivByX(int arr[10], int x)
{
    int arr_count, divider = 2;
    
    for(arr_count = 0; arr_count < 10; arr_count++)
    {
        while(arr[arr_count] % divider != 0)
        {
            if(arr[arr_count] == 1)
            {
                break;
            }
            divider++;
        }
        if(arr[arr_count] == divider)
        {
            printf("%d\n",arr[arr_count]);
        }
        divider = 2;
    }
    
    return;
}
