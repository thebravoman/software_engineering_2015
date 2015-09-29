#include <iostream>

using namespace std;

int isPrime(int num)
{
    int flag = 0;

    for(int i = 2; i < num; i++)
    {
        if(num % i == 0)
        {
            flag = 1;
        }
    }

    if(flag = 1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

int main()
{
    double x;

    do
    {
        cout << "Enter number between 0 and 1: " << endl;
        cin >> x;
    }
    while(x < 0 && x > 1);

    double sum = 0;
    int first = 5, second = first + 2;

    do
    {
        first += 2;
        second = first + 2;
        if(isPrime(first) == 0)
        {
            if(isPrime(second) == 0)
            {
                sum = (1 / first) + (1 / second);
            }
        }
    }
    while(sum > x);

    cout << "SUM = " << sum << endl;
    return 0;
}
