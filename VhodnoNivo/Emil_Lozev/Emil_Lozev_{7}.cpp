#include<iostream>

using namespace std;

int main()
{
    int x;

    do
    {
        cout << "Enter x: ";
        cin >> x;
    }
    while(x < 0 && x >100);

    int array10[10];
    int array5[5];
    
    int array5Counter = 0;

    for(int i = 0; i < 10; i++)
    {
            do
            {
                cout << "Enter element " << i << ": " << endl;
                cin >> array10[i];
            }
            while(array10[i] < x);

            if(i % 2 != 0)
            {
                array5[array5Counter] = array10[i];
                array5Counter++;
            }
    }

    for(int i = 0; i < 10; i++)
    {
        cout<<"Element " << i << " of array10 is equal to " << array10[i] << endl;
    }
    
    for(int i = 0; i < 5; i++)
    {
    	 cout<<"Element " << i << " of array5 is equal to " << array5[i] << endl;
    }

    return 0;
}
