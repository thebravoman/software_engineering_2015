#include <iostream>

using namespace std;

int main()
{
    int x;
    cout << "Enter x: "; cin >> x;
    while ((x < 0) || (x >= 10)){
        cout << "Enter x, again: "; cin >> x;
    }
    int iarr[10];

    int n, c, first = 0, second = 1, next;

    cout << "Enter the number of terms of Fibonacci series you want" << endl;
    cin >> n;

    cout << "First " << n << " terms of Fibonacci series are :- " << endl;

    for ( c = 0 ; c < n ; c++ )
    {
        if ( c <= 1 )
            next = c;
        else
        {
            next = first + second;
            first = second;
            second = next;
        }
        cout << next << endl;

        if (next % x == 0){
            cout << next << endl;
        }
    }

    return 0;
}
