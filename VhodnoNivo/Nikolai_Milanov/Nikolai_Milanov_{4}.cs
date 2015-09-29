using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem4
{
    class ProblemFour
    {
        static void Main()
        {
            int x = int.Parse(Console.ReadLine());
            int y = int.Parse(Console.ReadLine());
            if (x > y)
            {
                Console.WriteLine("Invalid input x > y");
            }
            else
            {
                int sum = 0;
                int firstNumber = 0;
                int secondnumber = 1;
                int swap;
                while (secondnumber < y)
                {
                    if (secondnumber > x)
                        Console.WriteLine(secondnumber);
                    swap = firstNumber + secondnumber;
                    firstNumber = secondnumber;
                    secondnumber = swap;
                }
            }
        }
    }
}
