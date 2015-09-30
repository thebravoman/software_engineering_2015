#include<stdio.h>
#include<math.h>

void CosSum(double*,int);

int main()
{
    int x;
    double array[10];
    
    do
    {
        printf("Please input a whole number between 0 and 10:\n");
        scanf("%d",&x);
    } while(x <= 0 || x >= 10);
    CosSum(array,x);
    
    return 0;
}

void CosSum(double arr[10], int x)
{
    int z, arr_count;
    double cos_sum;
    
    for(arr_count = 0; arr_count < 10; arr_count++)
    {
        for(z = arr_count * x, cos_sum = 0; z < (arr_count + 1) * x; z++)
        {
            cos_sum += cos(z);
        }
        arr[arr_count] = cos_sum;
        printf("%lf\n",arr[arr_count]);
        
    }
    
    return;
}
