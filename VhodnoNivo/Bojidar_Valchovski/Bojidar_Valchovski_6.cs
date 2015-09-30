using System;

namespace Bojidar_Valchovski_6
{
    class Program
    {
        static void Main()
        {
            int counter = 0;
            Console.Write("Insert a value for X - ");
            int x = int.Parse(Console.ReadLine());

            int[] numbers = new int[100];
            int[] sorted = new int[100];

            if (x < 10 && x > 0)
            {
                Random random = new Random(DateTime.Now.Millisecond);
                for (int i = 0; i < 100; i++)
                {          
                    int randNum = random.Next(100);
                    numbers[i] = randNum;
                    if (numbers[i] % 10 == x)
                    {
                        int temp = numbers[counter];
                        numbers[counter] = numbers[i];
                        numbers[i] = temp;
                        counter++;
                    }
                }
            }
            else
                Console.WriteLine("Invalid input, x must be less than 10 and greater than 0!");
            Console.ReadKey();
        }
    }
}
