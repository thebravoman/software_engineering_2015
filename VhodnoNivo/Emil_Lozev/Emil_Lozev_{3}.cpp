#include <iostream>

using namespace std;

int main()
{
    int num1, num2, sumOfNum = 0, counter = 1, isPrimeCounter = 0;

    cout << "Enter two numbers" << endl;
    cin >> num1;
    cin >> num2;

    if(num1 < num2)
    {
        for(int x = num1; x <= num2; x++)
        {
            while(counter <= x)
            {
                if(x % counter == 0)
                {
                    isPrimeCounter++;
                }
                counter++;

            }

            if(isPrimeCounter == 2)
            {
                if(x % 10 == 3)
                {
                    sumOfNum += x;
                }
            }
            isPrimeCounter = 0;
            counter = 1;
        }
    }
    else
    {
        for(int x = num2; x <= num1; x++)
        {
            while(counter <= x)
            {
                if(x % counter == 0)
                {
                    isPrimeCounter++;
                }
                counter++;
            }

            if(isPrimeCounter == 2)
            {
                if(x % 10 == 3)
                {
                    sumOfNum += x;
                }
            }
            isPrimeCounter = 0;
            counter = 1;
        }
    }

    cout << "The sum is equal to " << sumOfNum << endl;

    return 0;
}
