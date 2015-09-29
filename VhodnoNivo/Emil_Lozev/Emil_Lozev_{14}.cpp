#include<iostream>

using namespace std;

int main()
{
    int arrayOfSUM[10];
    int x;
    int sum = 0;
    int counter = 1;

    do
    {
    cout << "Enter number between 0 and 10:";
    cin >> x;
    }
    while(x < 0 || x > 10);

    for(int i = 0; i < 10; i++)
    {
        do
        {
            sum += counter;
            counter ++;
        }
        while(counter % x != 0);

        arrayOfSUM[i] = sum;

        counter++;
        sum +=counter;
    }

    for(int i = 0; i < 10; i++)
    {
            cout << "Element of array " << i << " is equal to: " << arrayOfSUM[i] << endl;
    }

    return 0;
}
