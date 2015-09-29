#include<iostream>

using namespace std;

int main()
{
    int arrayOfDevisor[10];

    int x;

    do
    {
        cout << "Enter positive x: ";
        cin >> x;
    }
    while(x < 0);

    int counter = 0, ifend = 0;

    for(int i = 0; i < 10; i++)
    {
        ifend = 0;
        do
        {
            counter++;

            if(x % counter == 0 && counter % 2 != 0)
            {
                arrayOfDevisor[i] = counter;
                ifend = 1;
            }
        }
        while(ifend != 1);
    }

    for(int i = 0; i < 10; i++)
    {
        cout << "Element " << i << " is equal to " << arrayOfDevisor[i] << endl;
    }

    return 0;
}
