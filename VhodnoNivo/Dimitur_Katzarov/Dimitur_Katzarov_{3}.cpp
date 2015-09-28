#include <iostream>

using namespace std;

bool isPrime(int num)
{
    for(int i = 2; i < num; i++)
    {
        if(num % i == 0)
            return false;
    }

    return true;
}

int main()
{
    int x = 0;
    int y = 0;
    int sum = 0;

    cin >> x;
    cin >> y;

    for(int i = x; i <= y; i++)
    {
        if(isPrime(i) && i % 10 == 3)
        {
                sum += i;
        }
    }

    cout<< sum << endl;

    return 0;
}
