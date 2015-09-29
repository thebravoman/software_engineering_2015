using System;

namespace Bojidar_Valchovski_18
{
    class Program
    {
        static void Main()
        {
            Console.WriteLine("Input a value for X - ");
            int x = int.Parse(Console.ReadLine());

            if (x >= 0)
            {
                int[] numbers = new int[10];
                int arrayCounter = 0;

                for (int i = 0; i < x; i++)
                {
                    if ((i % 2 != 0) && (x % i == 0))
                    {
                        numbers[arrayCounter] = i;
                        arrayCounter++;
                    }
                }
                for (int i = 0; i < numbers.Length; i++)
                {
                    if(numIsPrime(numbers[i]))
                        Console.WriteLine(numbers[i]);
                }
            }
            else
                Console.WriteLine("Invalid input! X must be greater or equal to 0!");
            Console.ReadKey();
        }

        static bool numIsPrime(int i)
        {
            if (i == 1) 
                return false;
            if (i == 2) 
                return true;

            if (i % 2 == 0) 
                return false; 

            for (int counter = 3; counter < i; counter += 2)
                if (i % counter == 0) 
                    return false;

            return true;
        }
    }
}
