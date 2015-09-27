#include <iostream>

using namespace std;

int main()
{
    int array10[10];
    int evenArray[10];
    int x;
    int counter = 0;

    do
    {
        cout << "Enter x: ";
        cin >> x;
    }
    while(x < 0 && x > 100);

    for(int i = 0; i < 10; i++)
    {
        do
        {
            cout << "Enter element " << i << ": " << endl;
            cin >> array10[i];
        }
        while(array10[i] <= x);

        if(array10[i] % 2 != 0)
        {
            evenArray[counter] = array10[i];
            counter++;
        }
    }

    for(int i = 0; i < 10; i++)
    {
        cout << "Element " << i << " is equal to " << array10[i] << endl;
    }

    for(int i = 0; i < counter; i++)
    {
        cout << "Element " << i << " is equal to " << evenArray[i] << endl;
    }

    return 0;
}
