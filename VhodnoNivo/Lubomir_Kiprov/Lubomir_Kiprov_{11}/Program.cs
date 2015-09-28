using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_11
{
    class Program
    {
        static void Main(string[] args)
        {
            double x;
            do
            {
                Console.WriteLine("Type number > 0 and number < 1");
                x = double.Parse(Console.ReadLine());
            } while (x <= 0 || x >= 1);
            double number1 = 4.0, number2 = 1.0, pi;
            do
            {
                pi = 0;
                pi = number1 / number2 - number1 / (number2 + 2);
                number2 += 4;
            } while (4.0 / number2 > x);
            Console.WriteLine(pi);
            
        }
    }
}
