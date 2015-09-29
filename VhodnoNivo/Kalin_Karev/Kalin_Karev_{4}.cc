#include <iostream>

using namespace std;

int nextFibonacci(int a, int b)
{
        return a+b;
}

bool InDiapason(int x, int y, int number)
{
    if(x<=number && number <=y)
    {
        return true;
    }
    else
    {
        return false;
    }
}

int main()
{
    int a = 1;
    int b = 1;
    int c = nextFibonacci(a, b);
    int x;
    int y;
    cin >> x >> y;

    cout << endl;

    if(InDiapason(x, y, a))
    {
        cout << a << endl;
    }

    while(!(a >= y))
    {
        a = b;
        b = c;
        c = nextFibonacci(a, b);
        if(InDiapason(x, y, a))
        {
            cout << a << endl;
        }
    }
    return 0;
}
