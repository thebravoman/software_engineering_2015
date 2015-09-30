#include <iostream>

using namespace std;

int main()
{
    int x, y;

    cin >> x;
    cin >> y;

    while(x <= y){
        if(x % 10 == 3){
            cout << x << endl;
        }
        x++;
    }


    return 0;
}
