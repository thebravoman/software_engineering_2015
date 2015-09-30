#include <iostream>
#include <cmath>
#include <algorithm>
using namespace std;

int main()
{
    int x;
    cout << "Enter x:";
    cin >> x;
    while ((x < 0) || (x > 10)){
        cout << "ERROR! Enter x: ";
        cin >> x;
    }
    int arr[10];
    int i = 0;
    for (i=0; i<x; i++){
        arr[i] = cos(i);
    }
    cout << "Enter array: " << endl;
    for (i=0; i<10; i++)
        cout << arr[i] << endl;
    cout << endl;

    sort(arr, arr+10);
    reverse(arr, arr+10);

    cout << "Sorted array: " << endl;
    for (i=0; i<10; ++i)
        cout << arr[i] << endl;
    return 0;
}
