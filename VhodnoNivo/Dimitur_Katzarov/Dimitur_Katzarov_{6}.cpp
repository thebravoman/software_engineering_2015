#include <iostream>
#include <cstdlib>

using namespace std;

int main()
{
    int x;

    cin >> x;

    int arr[100];

    for(int i = 0; i < 100; i++)
    {
        arr[i] = rand()%100 + 1;
    }

    for(int i = 0; i < 100; i++)
    {
        int first = 0;
        if(arr[i] % 10 == x)
        {
                int second = 0;
                second = arr[i];
                arr[i] = arr[first];
                arr[first] = second;
                first++;
        }
    }

    for(int i = 0; i < 100; i++)
    {
        cout << arr[i] << endl;
    }
    return 0;
}
