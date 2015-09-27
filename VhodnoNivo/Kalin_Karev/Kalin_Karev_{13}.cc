#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    int x;
    cout << "Enter x: ";
    cin >> x;
    while ((x <= 0) || (x >= 10)){
        cout << "Error! Enter x, again: ";
        cin >> x;
    }
    double arr[10];
    double sum = 0.0;
    for (int i=0; i<x; i++){
        sum = sum + cos(i);
    }
    arr[1] = sum;
    for (int j=2; j<10; j++){
        sum = 0.0;
        int start = j * x;
        int finish = (j+1) * x;
        for (int i = start; i<finish; i++){
            sum = sum + cos(i);
        }
        arr[j] = sum;
    }
    for (int j=2; j<10; j++){
        cout << arr[j] << endl;
    }

    return 0;
}
