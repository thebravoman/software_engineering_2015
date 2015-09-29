#include <iostream>
#include <cmath>

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
    for (i=0; i<10; i++){
        cout << cos(i) << endl;
    }

    /*for (i = 0; i < 10; i++){
        for (int j=0; j<10; j++){
            if (arr[j] > arr[j+1]){
                arr[j] = arr[j] + arr[j+1];
                arr[j+1] = arr[j] - arr[j+1];
                arr[j] = arr[j] - arr[j+1];
            }
        }
    }
    cout << endl;

    for (i=0; i<10; i++){
        cout << arr[i] << ' ' << endl;
    }*/

    return 0;
}
