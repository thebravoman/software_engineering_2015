/* Да се разработи програма, която изисква от потребителя
да въведе две целочислени числа, x и y, където x < y.
Да се намерят и изведат всички числа на Фибоначи в интервала [x, y].
*/

#include <iostream>
#include <stdlib.h>
using namespace std;

int main () {

    cout << "Enter X:";
    int x;
    cin >> x;

    cout << "Enter Y ( Y > X ):";
    int y;
    cin >> y;

    int a = 1, b = 1, help = 0;
    while (b <= y) {
        help = b;
        b = a+b;
        a = help;
        if (a >= x) { cout << "Fib: "<< a <<endl; }
    }

    return 0;
}
