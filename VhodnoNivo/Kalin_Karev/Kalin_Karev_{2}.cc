#include <iostream>
using namespace std;

int main()
{
    int x, y, i;
    int sum = 0;
    cout << "Enter two int numbers x, y: ";
    cin >> x >> y;
    if (x > y){
        cout << "Wrong input! \n";
    }
    for (i = x; i < y; i++){
        if (i % 17 == 0)
            sum = sum +i;
    }
    cout << "The sum of the numbers devided by 17 is: " << sum << endl;
    return 0;
}
