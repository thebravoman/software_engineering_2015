#include <iostream>

using namespace std;

int main()
{
    int num1, num2;

    cout << "Enter two numbers:" << endl;
    cin >> num1;
    cin >> num2;
	cout << endl;

    //Fibonacci Numbers
    int firstFib = 1, secondFib = 1, nextFib = 0;

    while(nextFib < num2)
    {
     nextFib = firstFib + secondFib;
     firstFib = secondFib;
     secondFib = nextFib;

     if(nextFib > num1 && nextFib < num2)
        {
          cout << nextFib << endl;
        }

    }
	

    return 0;
}
