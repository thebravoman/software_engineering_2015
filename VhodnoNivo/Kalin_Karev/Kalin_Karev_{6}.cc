#include <iostream>
#include <cstdlib>
#include <cmath>
#include <ctime>

using namespace std;

int main()
{
    int index = 0;
    int container1 = 0;
    int startIndex = 0;
    int container = 0;
    int x;
    cout << "Enter a number, 0 < x < 10: ";
    cin >> x;
    while (x >= 10 || x <= 0){
        cout << "Error! Enter again: ";
        cin >> x;
    }

    cout << endl;

    int arr[100];
    srand(int(time(0)));
    for (int i = 1; i < 101; i++)
        arr[i] = rand() % 99 + 1;
        //cout << arr[i] << endl;

        //cout << endl;

        for (int i=0; i<101; i++){
        if (arr[i] % 10 == x){
            //cout << i << "   " << endl;

                container = arr[i];
                index = i;
                container1 = arr[startIndex];

                arr[startIndex] = container;
                arr[i] = container1;

                startIndex++;
        }
    }
    cout << endl;

    for (int i=0; i<101; i++)
        cout << arr[i] << endl;

    return 0;
}
