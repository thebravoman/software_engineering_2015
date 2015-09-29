using System;

class Task16
{
    static bool ifPrime(int number)
    {
        for (int i = 2; i < number; i++)
        {
            if(number % i == 0 && i != number)
            {
                return false;
            }
        }
        return true;
    }

    static void Main()
    {
        int x = int.Parse(Console.ReadLine());
        int[] numbers = new int[10];
        bool found = false;
        int n = 2;
        for (int i = 0; i < numbers.Length; i++)
        {
            while(!found)
            {
                if(ifPrime(n) && n % 10 == x)
                {
                    numbers[i] = n;
                    found = true;
                }
                n++;
            }
            found = false;
        }

        foreach(int element in numbers)
        {
            Console.WriteLine(element);
        }
        
    }
}

