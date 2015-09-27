#include<iostream>

using namespace std;

int main()
{
    long long int arrayFib[10];
    int numUser;

    do
    {
    cout << "Enter a number between 0 and 10: ";
    cin >> numUser;
    }
    while(numUser <= 0 || numUser > 10);

    int firstFib = 1, secondFib = 1, nextFib = 0;
    int i = 0;

    do
    {
        nextFib = firstFib + secondFib;
        firstFib = secondFib;
        secondFib = nextFib;

        if(nextFib % numUser == 0)
        {
            arrayFib[i] = nextFib;
            i++;
        }
    }
    while(i <= 10);

    for(i = 0; i < 10; i++)
    {
        cout << "Element " << i << " is equal to " << arrayFib[i] << endl;
    }

return 0;
}
