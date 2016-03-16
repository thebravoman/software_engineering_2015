#include <iostream>

int gcd(int a, int b)
{
    while (a != b)
    {
        if (a > b)
        {
            return gcd(a - b, b);
        }
        else
        {
            return gcd(a, b - a);
        }
    }
  return a;
}

int main()
{
    int a, b, result;
    cout << "Enter the two numbers to find their GCD: " << endl;
    cin >> a >> b;
    result = gcd(a, b);
    cout << "GCD: " << result << endl;
}