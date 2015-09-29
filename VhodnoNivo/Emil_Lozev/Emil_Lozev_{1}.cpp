#include <iostream>

using namespace std;

int main()
{
    int firstNum;
    int secondNum;

    cout << "Enter two numbers:" << endl;
    cin >> firstNum >> secondNum;

    int sum = 0;

    if(firstNum < secondNum)
    {
        if(firstNum % 2 == 0)
        {
            firstNum += 1;
            while(firstNum <= secondNum)
            {
                sum += firstNum;
                firstNum += 2;
            }
        }
        else
        {
            while(firstNum <= secondNum)
            {
                sum += firstNum;
                firstNum += 2;
            }
        }
    }
    else
    {
        if(secondNum % 2 == 0)
        {
            secondNum += 1;
            while(secondNum <= firstNum)
            {
                sum += secondNum;
                secondNum += 2;
            }
        }
        else
        {
            while(secondNum <= firstNum)
            {
                sum += secondNum;
                secondNum += 2;
            }
        }
    }

    cout << "The sum of these two numbers is " << sum << endl;

    return 0;
}
