#include<iostream>

using namespace std;

int main()
{
    unsigned int arrayOfFib[10];
    int x;

    do
    {
        cout << "Enter num between 0 and 10: ";
        cin >> x;
    }
    while(x < 0 && x > 10);

    unsigned int firstFib = 1, secondFib = 1, nextFib = 0;
    int ifend = 0;

    for(int i = 0; i < 10; i++)
    {
        do
        {
            nextFib = firstFib + secondFib;
            firstFib = secondFib;
            secondFib = nextFib;

            if(nextFib % 10 == x)
            {
                arrayOfFib[i] = nextFib;
                ifend = 1;
            }
        }
        while(ifend != 1);
        ifend = 0;
    }

    for(int i = 0; i < 10; i++)
    {
        cout << "Element " << i << " is equal to " << arrayOfFib[i] << endl;
    }

    return 0;
}
