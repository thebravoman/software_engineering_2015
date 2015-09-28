/* Да се разработи програма, която изисква от потребителя да въведе
целочислено число x, където x e интервала [0; +∞).
Да се намерят първите 10 нечетни числа делители на x и да се запишат в масив.
Масивът да се изведе на екрана и да се намерят простите числа в този масив.
*/

#include <iostream>

using namespace std;

int main() {

    int x = -1;
    while (x < 0) {
        cout << "Enter X ( x>0 ): ";
        cin >> x;
    }

    int arr[10];
    int a = 0;
    for (int i = 1; i > -1; i++) {
        if ((x%i == 0) && (i%2 == 1)) {
            arr[a] = i;
            a++;
        }
        if (a >= 10) {break;}
        if (i > x) {break;}
    }

    cout << "Array: ";
    for (int i = 0; i < a; i++) {
        cout << arr[i] << "  ";
    }
    cout << endl;

    int baba = 0;
    for (int i = 0; i < a; i++) {
        baba = 0;
        for (int m = 2; m < arr[i]; m++) {
            if (arr[i]%m == 0) {
                baba++;
            }
        }
        if (baba == 0) {
            cout << "Array [" << i << "] is "
                << arr[i] << " and it is A PRIME NUMBER !!! " << endl;
        }
    }

    return 0;
}
