#include <iostream>

using namespace std;

int main()
{
  int n;
  cout << "Input a number:" << endl;
  cin >> n;
  cout << "the numbers are:" << endl;
  int i;
  for(i = 2; i < n; i++)
  {
    if(n%i == 0)
    {
      cout << i << " " << endl;
    }
  }
  return 0;
}