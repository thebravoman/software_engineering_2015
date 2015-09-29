#include<iostream>

using namespace std;

int main()
{
    int arrayOfModulus[10];
    int x, n = 1;

    do
    {
        cout << "Enter number x: ";
        cin >> x;
    }
    while(x < 0 || x >10);

    for(int i = 0; i < 10; i++)
    {
        int sum = 0;

        for(int counter = 1; counter < 1000; counter++)
        {
            if(counter % (n * x) == 0)
            {
                sum += counter;
            }
        }
        arrayOfModulus[i] = sum;
    }

    for(int i = 0; i < 10; i++)
    {
        cout << "Element " << i << " of the array is equal to " << arrayOfModulus[i] << endl;
    }

    return 0;
}
