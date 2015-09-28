#include<stdio.h>

void PlateDivision(int*,int,int,int,int);

int main()
{
    int x,y,w,h;
    int array[10];
    do
    {
        printf("Please input the length and height of a wooden plate and the length and height of smaller plates into which it will be divided:\n");
        scanf("%d %d %d %d",&x,&y,&w,&h);
    } while(x <= 0 || y <= 0 || w <= 0 || h <= 0);
    
    PlateDivision(array,x,y,w,h);
    
    return 0;
}

void PlateDivision(int arr[10],int x,int y,int w,int h)
{
   int arr_counter, plates, plates_by_length, coordinate;
   
   plates = (x/w)*(y/h);
   plates_by_length = x/w;
   printf("%d plates\n",plates);
   for(arr_counter = 0, coordinate = 0; arr_counter < plates_by_length; arr_counter++)
   {
           coordinate += w;
           arr[arr_counter] = coordinate;
           printf("%d\n",arr[arr_counter]);   
   }
   
   return;
}
