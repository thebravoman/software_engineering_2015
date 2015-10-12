#include<stdio.h>
#include<math.h>

void Array_Init(double*,int);

int main()
{
    int x;
    double array[10];
    do
    {
        printf("Please input a whole number between 0(including) and 10:\n");
        scanf("%d",&x);
    } while(x < 0 || x >= 10);
    Array_Init(array,x);
    
    return 0;
}

void Array_Init(double arr[10],int x)
{
    int val_count,cos_var = 1;
    int cos_val;
    
        for(val_count = 0, cos_var = 0; val_count < 10; cos_var++)
        {
          cos_val = cos(cos_var) * 1000;
          if(cos_val % 10 == x)
          {
              arr[val_count] = cos(cos_var);
              printf("%lf\n",arr[val_count]);
              val_count++;
          }
        } 
    
    return;
}
