#include <iostream>
#include <cmath>

using namespace std;


int main()
{
    int x;

    do
    {
        cout << "Enter x: ";
        cin >> x;
    }
    while(x < 0 || x >= 10);

    double arrayCos[10];
    int cosCounter = 0;
    int resultCos;
    

    for(int i = 0; i < 10; i++)
    {
        int ifend = 0;
        do
        {
            cosCounter++;
            resultCos = cos(cosCounter) * 1000;

            if(resultCos % 10 == x)
            {
                arrayCos[i] = cos(cosCounter);
                ifend = 1;
            }

        }
        while(ifend != 1);
    }

    for(int i = 0; i < 10; i++)
    {
        cout << arrayCos[i] << endl;
    }

    return 0;
}
