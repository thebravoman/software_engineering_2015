#include <iostream>
using namespace std;

int main()
{
    int x, y, w, h;
    cout << "Enter x, y, w, h: ";
    cin >> x >> y >> w >> h;
    while ((x < 0) || (y < 0) || (w < 0) || (h < 0)){
        cout << "Enter x, y, w, h: ";
        cin >> x >> y >> w >> h;
    }
    int Sxy = x * y;
    int Swh = w * h;
    cout << "The number is: " << Sxy / Swh << endl;

    int arr[10];
    for (int i=0; i<x; i++){
        cout << i << endl;
    }
    return 0;
}
