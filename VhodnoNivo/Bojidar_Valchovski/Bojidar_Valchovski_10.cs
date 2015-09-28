using System;

namespace Bojidar_Valchovski_10
{
    class Program
    {
        static void Main()
        {
            Console.Write("Insert a value for X - ");
            int x = int.Parse(Console.ReadLine());
            
            if (x >= 0 && x < 10)
            {
                long[] numbers = new long[10];
                
                int arrayCounter = 0;
                bool found = false;

                long a = 0, b = 1;

                while(!found)
                {
                    long temp = a;
                    a = b;
                    b = temp + b;
                    if (a % x == 0)
                    {
                        numbers[arrayCounter] = a;
                        arrayCounter++;
                    }
                    if (arrayCounter == 10)
                        found = true;
                }
                for (int i = 0; i < numbers.Length; i++)
                {
                    Console.WriteLine(numbers[i]);
                }
            }
            else
                Console.WriteLine("Invalid input! X must be less than 10 and greater or equal to 0!");
            Console.ReadKey();
        }
    }
}
