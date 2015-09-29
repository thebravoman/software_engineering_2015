#include <iostream>

using namespace std;

int main()
{
    int x = 0;
    int y = 0;
    int sum = 0;

    cin >> x;
    cin >> y;

    for(int i = x; i <= y; i++)
    {
        if(i % 17 == 0)
            sum += i;
    }

    cout<< sum << endl;

    return 0;
}
