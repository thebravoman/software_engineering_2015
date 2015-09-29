using System;

namespace Bojidar_Valchovski_1
{
    class Program
    {
        static void Main()
        {

            /* TASK - Da se razraboti programa, koqto iziskva ot potrebitelq da vuvede dve celochisleni
             * chisla, x i y, kydeto x < y. Da se nameri sumata na vsichki nechetni chisla v intervala
             * [x,y]. */

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
                    if (counter % 2 != 0)
                        sum += counter;
                Console.WriteLine("The sum of all odd numbers is equal to {0}!", sum);
            }
            Console.ReadKey();       
        }
    }
}
