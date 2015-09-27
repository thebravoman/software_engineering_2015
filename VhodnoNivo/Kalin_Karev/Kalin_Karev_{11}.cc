#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    double x;
    cout << "Enter x, 0 < x < 1: ";
    cin >> x;

    while ((x < 0) || (x >= 1)){
        cout << "ERROR! Enter x, 0 < x < 1: ";
        cin >> x;
    }

    double pi = 0.0;
    int counter = 1;

    for (int i = 1; ; i += 2){
        double a = 4.0;
        double b = 0.0;

        b = a / static_cast <double>(i);

        if (counter % 2 == 0){
            pi -= b;
        } else
            pi += b;

        if (counter % 1000 == 0)
            cout << pi << " " << counter << endl;

        if ( 4 / i < x)
            break;

        counter++;
    }
    cout << pi;

    return 0;
}
