using System;

class Task3
{
    static bool IsPrimeNumber(int number)
    {
        for(int i = 2; i < number; i++)
        {
            if(number % i == 0 && number != 0)
            {
                return false;
            }
        }
        return true;
    }

    static void Main()
    {
        int x = int.Parse(Console.ReadLine());
        int y = int.Parse(Console.ReadLine());
        for(int i = x; i <= y; i++)
        {
            if(IsPrimeNumber(i))
            {
                if (i % 10 == 3)
                {
                    Console.WriteLine(i);
                }
            }
        }
    }
}

