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
    for (i=0; i<1000; i++){
        if (i % x == 0){
            result = result + i;
        }
    }
    arr[0] = result;
    result = 0;
    for (i=0; i<1000; i++){
        if (i%(2*x) == 0){
            result = result + i;
        }
    }
    arr[1] = result;
    for (int j=2; j<10; j++){
        result = 0;
        for (i=0; i<1000; i++){
            if (i%((j+1)*x) == 0)
                result = result + i;
        }
        arr[j] = result;
    }
    for (int j=2; j<10; j++)
        cout << arr[j] << endl;
    return 0;
}
