using System;

namespace Bojidar_Valchovski_2
{
    class Program
    {
        static void Main()
        {
            int sum = 0;
            Console.Write("Insert a value for X - ");
            int x = int.Parse(Console.ReadLine());
            Console.Write("Insert a value for Y - ");
            int y = int.Parse(Console.ReadLine());
            if (x > y)
                Console.WriteLine("Invalid input, X must be less than Y!");
            else
            {
                for (int counter = x; counter <= y; counter++)
                    if (counter % 17 == 0)
                        sum += counter;
                Console.WriteLine("The sum of all numbers in the [x,y] range, that are dividable by 17 is equal to {0}", sum);
            }
            Console.ReadKey();
        }
    }
}
