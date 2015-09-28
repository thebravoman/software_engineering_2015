using System;

namespace Bojidar_Valchovski_7
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
                int[] numbersTwo = new int[5];
                int counter = 0;

                for (int i = 0; i < numbers.Length; i++)
                {
                    numbers[i] = x + i + 1;
                    if (i % 2 == 0)
                    {
                        numbersTwo[counter] = x + i + 1;
                        counter++;
                    }
                }
                for (int i = 0; i < numbersTwo.Length; i++)
                {
                    Console.WriteLine("{0}",numbersTwo[i]);
                }
            }
            else
                Console.WriteLine("Invalid input, x must be less than 10 and greater than 0!");
            Console.ReadKey();
        }
    }
}
