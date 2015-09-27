#include <iostream>

using namespace std;

bool ifPrime(int num){
    for (int i=2; i<num; i++){
        if (num % i == 0 && i != num){
            return false;
        }
    }
    return true;
}

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
    bool namereno = false;
    int a = 2, i = 0;
    for (i=0; i<10; i++){
        while (!namereno){
            if (ifPrime(a) && a % 10 == x){
                arr[i] = a;
                namereno = true;
            }
            a++;
        }
        namereno = false;
    }
    for (i=0; i<10; i++)
        cout << arr[i] << endl;
    return 0;
}
