#include<iostream>

using namespace std;

int main()
{
    int x;

    do
    {
        cout << "Enter number between 0 and 10: " << endl;
        cin >> x;
    }
    while(x < 0 || x > 10);

    int arrayOfPrimes[10];
    int endingX = 2;
	int ifend = 0;

	for(int i = 0; i < 10; i++)
	{
		do
		{
			int flag = 0;
			
			if(endingX % 10 == x)
			{
				
				for(int counter = 1; counter < endingX; counter++)
				{
					if(endingX % counter == 0)
					{
						flag++;
					}
				}
				
				
			}
			
			if(flag == 2)
			{
				arrayOfPrimes[i] = endingX;
				ifend++;
			}
					
			flag = 0;
			endingX++;
		}
		while(ifend != 1);
		
		ifend = 0;
	}

    /*for(int i = 0; i < 10; i++)
    {
            if(isPrime % 10 == x)
            {
                int flag = 0;
                for(int counter = 2; counter < isPrime ; counter++)
                {
                    if(isPrime % counter == 0)
                    {
                        flag++;
                        break;
                    }

                    if(flag == 0)
                    {
                        arrayOfPrimes[i] = isPrime;
                    } 
                    
                    flag = 0;
                }
            }
            isPrime++;
           
    }
    */

    for(int i = 0; i < 10; i++)
    {
        cout << "Element " << i << " is equal to " << arrayOfPrimes[i] << endl;
    }

    return 0;
}
