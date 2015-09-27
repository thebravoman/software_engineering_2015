#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    int x;
    cout << "Enter x: ";
    cin >> x;
    int i = 0;
    int Cos = 1;
    double arr[10];
    bool ok = false;
    for (i = 0; i < 10; i++){
        while (!ok){
            double num = cos(Cos);
            Cos++;
            int likex = (static_cast<int> (num * 1000) % 10);
            if ((num> 0.0) && (likex == x)){
                arr[i] = num;
                ok = true;
            }
        }
        ok = false;
    }
    for (i=0; i<10; i++){
        cout << arr[i] << endl;
    }

    return 0;
}
