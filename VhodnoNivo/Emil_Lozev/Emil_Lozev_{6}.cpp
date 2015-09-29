#include <iostream>
#include <cstdlib>

using namespace std;

int main()
{
    int x;

    cout << "Enter num: ";
    cin >> x;

    int arr[100], i;

    for(i = 0; i < 100; i++)
    {
        arr[i] = rand()%100 + 1;
    }

    for(i = 0; i < 100; i++)
    {
        int firstCount = 0;
        if(arr[i] % 10 == x)
        {

                int temp;

                temp = arr[i];
                arr[i] = arr[firstCount];
                arr[firstCount] = temp;

                firstCount++;

        }
    }

    for(int i; i < 100; i++)
    {
        cout << arr[i] << endl;
    }
    return 0;
}
