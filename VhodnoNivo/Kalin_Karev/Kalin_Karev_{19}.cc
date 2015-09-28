#include <iostream>

using namespace std;

int main()
{
    int x;
    cout << "Enter x: ";
    cin >> x;
    while ((x < 0) || (x > 1)){
        cout << "Error! Enter x: ";
        cin >> x;
    }
    int low, high, n = 0, con = 0, i;
    cin >> low >> high;
    if (low <= 3)
        con++;

    while (n < low)
        n += 6;

    while (n < high){
        i = 1;
        int flag = 0;
        while (i * i < n + 1){
            i++;
            if ((n-1) % i == 0 || (n+1) % i ==0)
                flag = 1;
        }
        if (!flag)
            con++;
        n += 6;
    }
    cout << low << high << con << endl;
    return 0;
}
