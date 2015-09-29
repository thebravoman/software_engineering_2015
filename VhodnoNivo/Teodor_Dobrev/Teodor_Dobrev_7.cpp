/* Да се разработи програма, която изисква от потребителя да
въведе целочислено число X, където 0 < X < 100.
Да се инициализира масив от 10 целочислени елемента, всеки един > X.
Всеки втори елемент да се запише в нов масив с размер 5.
Полученият масив да се изведе на екрана.
*/

#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;

int main() {

    int x;
    cout << "Enter X ( 0 < X < 100 ): ";
    cin >> x;

    int arr[10];
    int arr1[10];
    int counter = 0;
    srand (time(NULL));
    for ( int i = 0; i < 10; i++ ) {
        arr[i] = (rand() % (100-x)) + x;
        if (i % 2 == 1) {
            arr1[counter] = arr[i];
            cout << arr[i] << "   ";
            counter++;
        }
    }

    return 0;
}
