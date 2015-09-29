#include <iostream>
using namespace std;

int main()
{
    int x;
    cout << "Enter x: ";
    cin >> x;

    while (x < 0){
        cout << "Error! Enter x again: ";
        cin >> x;
    }

    const int a_size = 10;
    const int b_size = 5;

    int arr[a_size] = {1, 3, 6 , 3, 4, 5 , 6, 8, 5};
    int m[b_size];
    int i = 0;
    int bx = 0;

    for (int ax = 0; ax < a_size; ax += 2){
            m[bx++] = arr[ax];
            cout << "They are: " << arr[ax] << endl;
    }
    return 0;
}
