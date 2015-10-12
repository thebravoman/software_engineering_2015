#include <iostream>

using namespace std;

int main()
{
    int x = 0;
    int y = 0;
    int firstNum = 1;
    int secondNum = 1;
    int sum = 1;

    cin >> x;
    cin >> y;

    while(secondNum < y)
    {
        if(sum >= x)
            cout<< sum <<endl;
        sum = firstNum + secondNum;
        firstNum = secondNum;
        secondNum = sum;
    }

    return 0;
}
