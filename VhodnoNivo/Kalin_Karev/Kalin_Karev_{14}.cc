#include <iostream>

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
    int arr[10];
    int result = 0;
    int i = 0;
    for (i=0; i<=x; i++){
        result = result + i;
    }
    arr[0] = result;
    for (i=1; i<10;i++){
        result = 0;
        for (int j=0; j<=x*(i+1); j++){
            result = result + j;
        }
        arr[i] = result;
    }
    for (i=0;i<=x;i++){
        cout << arr[i] << endl;
    }
    return 0;
}
