#include <iostream>
using namespace std;

int main()
{
    int x, y;
    int sum = 0;
    cout << "Enter two numbers (x < y): ";
    cin >> x >> y;
    if (x > y){
        cout << "Wrong! \n";
    }
    int i;
    for (i = x; i <= y; i++)
    {
        if (i % 2 != 0)
            sum = sum + i;
    }
    cout << "The sum of the odd numbers between x and y: " << sum << endl;
    return 0;
}
