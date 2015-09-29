/* Да се разработи програма, която изисква от
 потребителя да въведе целочислено число x,
 където 0<=x<10. Да се инициализира масив от
 10 елемента. Да се намерят първите 10 числа на
 Фибоначи в [0; +∞), които се делят на x без остатък.
 Намерените стойности да се зададат като стойности на
 елементите в масива. Елементите на масива да се
 изведат на стандартния изход.
*/

#include <iostream>

using namespace std;

int main() {

    int x = -1;
    while ((x <= 0) || (x >=10)) {
        cout << "Enter integer X ( 0 < X < 10 ): ";
        cin >> x;
    }

    long long int arr[10];

    long long int a = 1, b = 1, helper = 0, counter = 0;
    while (counter < 10) {
        helper = b;
        b = a+b;
        a = helper;
        if (b % x == 0) {
            counter++;
            arr[counter] = b;
        }
    }
    for (int i = 0; i < 10; i++) {
        cout << "Fibb: "<< arr[i+1] <<endl;
    }
    return 0;
}
