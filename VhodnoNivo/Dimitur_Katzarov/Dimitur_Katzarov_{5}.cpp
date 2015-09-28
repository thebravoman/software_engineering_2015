#include <iostream>
#include <math.h>

using namespace std;

int main()
{
    int x = 0;
    double arr[10];

    cin >> x;

    for(int i = 0; i < 10; i ++)
    {
        arr[i] = cos(i);
        cout<< arr[i] <<endl;
    }

    cout<<"\n\n\n"<<endl;

    for(int i = 0; i < 9; i++)
    {
        for(int j = 0; j < 9; j++)
        {
            if(arr[j] < arr[j + 1])
            {
                swap(arr[j], arr[j + 1]);
            }
        }
    }

    for(int i = 0; i < 10; i ++)
    {
        cout<<arr[i]<<endl;
    }
}
