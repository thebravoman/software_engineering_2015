#include <iostream>

using namespace std;

int main()
{
    int num1, num2;

    cout << "Enter two numbers:" << endl;
    cin >> num1;
    cin >> num2;

    int sumModulus = 0;

    if(num1 < num2)
    {
        while(num1 <= num2)
        {
            if(num1 % 17 == 0)
            {
                sumModulus += num1;
            }
            num1++;
        }
    }
    else
    {
          while(num2 <= num1)
        {
            if(num2 % 17 == 0)
            {
                sumModulus += num2;
            }
            num2++;
        }
    }

    cout << "The sum is " << sumModulus << endl;

 return 0;
}
