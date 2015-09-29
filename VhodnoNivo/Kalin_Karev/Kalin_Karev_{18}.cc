#include <iostream>

using namespace std;

int main()
{
    int x;
    cout << "Enter x: ";
    cin >> x;
    while (x < 0){
        cout << "ERROR! Enter x: ";
        cin >> x;
    }

    int d1 = 0;
    int i = 0;
    int ost = 0;
    for (i=0; i<x; i++){
        if (d1 < 10){
            ++i;
            ost = x % i;
            if (ost = 0){
                d1 = i + 1;
            }
        } else
            cout << "NO!" << endl;
        cout << i << endl;
    }

    return 0;
}
