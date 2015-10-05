#include <iostream>

using namespace std;

int main()
{
    int x, y;
    int sum = 0;

    cin >> x;
    cin >> y;

    if(x < y){
        while(x <= y){
            if(x%2 != 0){
                sum += x;
            }
            x++;
        }
        cout << sum << endl;
    }


    return 0;
}
