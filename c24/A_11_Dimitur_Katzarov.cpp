#include <iostream>

using namespace std;

int main(int argc, char* argv[])
{
    int number, maxDel;
    cin >> number;
    maxDel = number / 2;

    for (int i = 2; i <= maxDel; i++)
    {
        if (number % i == 0)
        {
            cout << i << endl;
        }
    }

    cout << number <<endl;
 }
