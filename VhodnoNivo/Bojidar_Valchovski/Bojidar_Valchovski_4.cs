using System;

namespace Bojidar_Valchovski_4
{
    class Program
    {
        static void Main()
        {
            Console.Write("Insert a value for X - ");
            int x = int.Parse(Console.ReadLine());
            Console.Write("Insert a value for Y - ");
            int y = int.Parse(Console.ReadLine());
            if (x > y)
                Console.WriteLine("Invalid input, X must be less than Y!");
            else
            {
                for (int num = x; num <= y; num++)
                {
                    int a = 0, b = 1;
                    for (int counter = 0; counter < num ; counter++)
                    {
                        int temp = a;
                        a = b;
                        b = temp + b;
                        if (a == num)
                            Console.WriteLine("{0}",a);
                    }
                }
            }
            Console.ReadKey();
        }
    }
}
