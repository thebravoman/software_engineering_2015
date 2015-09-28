#include<stdio.h>
#include<math.h>

void Array_Init(double*);
void Array_Sort(double*);

int main()
{
    int x;
    double array[10];
    
    do
    {
        printf("Please input a whole number between 0 and 10:\n");
        scanf("%d",&x);
    } while(x <= 0 || x >= 10);
    Array_Init(array);
    Array_Sort(array);
    return 0;
}

void Array_Init(double arr[10])
{
    int counter;
    for(counter = 0; counter < 10; counter++)
    {
        arr[counter] = cos(counter);
        printf("%lf\n",arr[counter]);
    }
    return;
}

void Array_Sort(double arr[10])
{
    int counter,counter_2;
    double var;
    for(counter = 0; counter < 10 - 1; counter++)
    {
        for(counter_2 = 0; counter_2 < (10 - (counter + 1)); counter_2++)
        {
            if(arr[counter_2] < arr[counter_2+1])
            {
                var = arr[counter_2];
                arr[counter_2] = arr[counter_2+1];
                arr[counter_2+1] = var;
            }
        }
    }
    printf("---Sorted---\n");
    for(counter = 0; counter < 10; counter++)
    {
       printf("%lf\n",arr[counter]);
    }
    return;
}
