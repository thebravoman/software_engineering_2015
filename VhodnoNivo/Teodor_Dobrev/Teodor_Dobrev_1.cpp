#include <iostream>
using namespace std;

int main() {

    // enter x and y
    cout << "Enter X and enter Y ( X must be smaller than Y )" << endl;
    int x = 0, y = 0;
    cout << "Enter X now : " ;
    cin >> x;
    cout << "Enter Y now : " ;
    cin >> y;

    // find the sum of all the odd numbers between X and Y
    int calc = 0;
    int i = 0;

    while (i <= y) {
        if (i % 2 == 1) { calc+=i; }
        i++;
    }

    cout << "calculation = " << calc << endl;

    return 0;
}
