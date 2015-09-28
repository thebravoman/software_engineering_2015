#include <iostream>
using  namespace std;

int main() {

    cout << "Enter X :";
    int x = 0;
    cin >> x;

    cout << "Enter Y ( bigger than X ) :";
    int y = 0;
    cin >> y;

    int counter = 0;
    int sum = 0;

    while ( counter <= y ) {
        if ( counter % 17 == 0 ) { sum += counter; }
        counter++;
    }
    cout << "The sum is: " << sum << endl;

    return 0;
}
