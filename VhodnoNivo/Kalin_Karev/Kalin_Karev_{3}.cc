#include <iostream>
using namespace std;

int main()
{
    int x, y;
    cout << "Enter two int numbers:" << endl;
    cin >> x >> y;
    cout << endl;
    for (int i = 2; i <= y; i++){
        for (int j = 2; j <= i; j++){
            if (i % j == 0)
                break;
            else if (i == j + 1)
                if (i % 10 == 3)
                    cout << i << " " << endl;
        }
    }
    return 0;
}
