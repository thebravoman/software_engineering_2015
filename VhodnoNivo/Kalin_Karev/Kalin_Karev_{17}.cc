#include <iostream>
using namespace std;

int nextFibonacci(int a, int b)
{
    return a + b;
}

int main()
{
    int x;
    cout << "Enter x: ";
    cin >> x;
    while ((x < 0) || (x >= 10)){
        cout << "Error! Enter x again: ";
        cin >> x;
    }

    int arr[10];
    int number1 = 1;
    int number2 = 1;
    int number3 = 0;
    int i = 0;
    while (i < 10){
        number3 = nextFibonacci(number1, number2);
        if (number3 % 10 == x){
            arr[i] = number3;
            i++;
        }
        number1 = number2;
        number2 = number3;
    }
    for (i = 0; i < 10; i++)
        cout << arr[i] << endl;
    return 0;
}
