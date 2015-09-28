//Да се разработи програма, която изисква от потребителя да въведе
// две целочислени числа, x и y, където x < y.
// Да се намерят и изведат всички прости числа
// завършващи на 3 в интервал [x,y].

#include <iostream>
using namespace std;

int main () {

    cout << "Enter X: ";
    int x = 0;
    cin >> x;

    cout << "Enter Y: ";
    int y = 0;
    cin >> y;

    int counter0 = 0;
    int counter1 = 0;
    int counter2 = 0;

    for (counter0 = x; counter0 <= y; counter0++ ) {
        counter2 = 0;
        if (counter0 % 10 == 3) {
            for (counter1 = 2; counter1 < counter0; counter1++) {
                if (counter0 % counter1 == 0) { counter2++;}
            }
            if (counter2 == 0) {
                cout << "Prime number and with '3' for last: " << counter0 << endl;
            }
        }
        counter2 = 0;
    }

    return 0;
}
