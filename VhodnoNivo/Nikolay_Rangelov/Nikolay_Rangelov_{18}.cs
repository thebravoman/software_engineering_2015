using System;

class Task18
{
    static bool ifPrime(int number)
    {
        for (int i = 2; i < number; i++)
        {
            if (number % i == 0 && i != number)
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
        int counter = 0;
        for (int i = 0; i < numbers.Length; i++)
        {
            while (true)
            {
                if (counter % 2 == 1)
                {
                    numbers[i] = counter;
                    counter++;
                    break;
                }
                counter++;
            }
        }

        foreach(int element in numbers)
        {
            if(ifPrime(element))
            {
                Console.WriteLine(element + "- prime");
            }
            else
            {
                Console.WriteLine(element);
            }
        }

    }
}

