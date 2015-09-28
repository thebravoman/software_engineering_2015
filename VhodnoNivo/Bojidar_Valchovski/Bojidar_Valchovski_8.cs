using System;

namespace Bojidar_Valchovski_8
{
    class Program
    {
        static void Main()
        {
            Console.Write("Insert a value for X - ");
            int x = int.Parse(Console.ReadLine());

            if (x > 0 && x < 100)
            {
                int[] numbers = new int[10];
                int[] numbersTwo = new int[10];
                int counterOne = 0;
                int counterTwo = 0;

                for (int i = 0; i < numbers.Length*2; i++)
                {
                    if ((x + i + 1) % 2 != 0)
                    {
                        numbersTwo[counterOne] = x + i + 1;
                        counterOne++;
                    }
                    else
                    {
                        numbers[counterTwo] = x + i + 1;
                        counterTwo++;
                    }
                }
                for (int i = 0; i < numbersTwo.Length; i++)
                {
                    Console.WriteLine("{0}", numbersTwo[i]);
                }
            }
            else
                Console.WriteLine("Invalid input, x must be less than 10 and greater than 0!");
            Console.ReadKey();
        }
    }
}
