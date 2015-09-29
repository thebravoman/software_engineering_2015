#include <iostream>

using namespace std;

bool input(int x, int y)
{
    if(x > y)
        return false;

    return true;
}

int main()
{
    int x = 0;
    int y = 0;
    int sum = 0;

    cin >> x; cin.ignore();
    cin >> y; cin.ignore();

    if(input(x,y) != true)
    {
        cout<<"Input was invalid"<<endl;
        return 1;
    }

    for(int i = x; i <= y; i++)
    {
        if(i % 2 == 1)
            sum += i;
    }

    cout<< sum << endl;

    return 0;
}
