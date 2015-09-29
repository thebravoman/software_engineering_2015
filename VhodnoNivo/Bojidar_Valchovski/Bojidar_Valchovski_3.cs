using System;

namespace Bojidar_Valchovski_3
{
    class Program
    {
        static void Main()
        {
            bool numIsPrime = true;
            Console.Write("Insert a value for X - ");
            int x = int.Parse(Console.ReadLine());
            Console.Write("Insert a value for Y - ");
            int y = int.Parse(Console.ReadLine());
            if (x > y)
                Console.WriteLine("Invalid input, X must be less than Y!");
            else
            {
                if (x == 1)
                    x += 1;
                for (int num = x; num <= y; num++)
                {
                    for (int j = 2; j <= y; j++)
                    {

                        if ((num != j) && (num % j == 0))
                        {
                            numIsPrime = false;
                            break;
                        }
                    }

                    if (numIsPrime)
                        Console.WriteLine(num);
                    numIsPrime = true;
                }
            }
            Console.ReadKey();
        }
    }

}
