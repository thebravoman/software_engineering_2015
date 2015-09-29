#include<iostream>

using namespace std;

int main()
{
    int x, y, w, h;

    cout << "Enter height and width: ";
    cin >> x >> y;

    cout << "Enter height and width for the block: ";
    cin >> h >> w;

    int heightTotal = 0;
    int widthTotal = y;
    int cutBox = 0;


	while(x > 0)
	{
		x -= h;
		do
		{
			widthTotal -= w;
			cutBox++;
		}
		while(widthTotal > 0);
	
		widthTotal = y;
	}
	




    /*do
    {
        if(h <= x)
        {
            if(w <= y)
            {
                heightTotal += h;
                x -= x;
                while(widthTotal < y)
                {
                   y = y - w;
                   cutBox++;
                }
            }
        }
        widthTotal = 0;
    }
    while(heightTotal <= x);
	*/
	
    cout << "You can cut total of " << cutBox << " boxes" << endl;

return 0;
}
