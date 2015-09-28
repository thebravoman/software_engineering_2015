#include <iostream>

using namespace std;

int main()
{
    int arr[100], i, n;

    cout << "Enter how many elements is the array from: ";
    cin >> n;

    for (i = 0; i < n; i++){
        cout << "Enter " << i << " element: " << endl;
        cin >> arr[i];
    }

    for (i = 0; i < n; i++){
        if (arr[i] % 2 != 0)
            cout << "Odd numbers are: " << arr[i] << endl;
    }

    return 0;
}
