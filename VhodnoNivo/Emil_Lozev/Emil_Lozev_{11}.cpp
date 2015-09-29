#include <iostream>

using namespace std;

int main()
{
    double x;
    double PI = 0;

    do
    {
        cout << "Enter x: ";
        cin >> x;
    }
    while(x < 0 || x > 1);

    int n = 3;
    double preResult = 4 - (4 / n);
    int i = 1;

    do
    {
        n += 2;
		cout << "Printsomething" << endl;
        if(i % 2 == 0)
        {
            PI = preResult - (4 / n);
        }
        else
        {
            PI = preResult + (4 / n);
        }

        i++;
    }
    while((4 / n) > x);

    cout << "PI = " << PI << endl;

    return 0;
}
