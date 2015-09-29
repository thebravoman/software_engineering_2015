using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Problem7
{
    class ProblemSeven
    {
        static void Main()
        {
            int num = int.Parse(Console.ReadLine());
            double[] result = new double[10];
            if (0 <= num && num < 10)
            {
                int i = 0;
                int position = 0;
                while (position < 10)
                {
                    char number = char.Parse(num.ToString());
                    double current = Math.Cos(i);
                    if (current.ToString().Length > 6)
                    {
                        if ((current > 0 && current.ToString()[4] == number) ||
                            (current < 0 && current.ToString()[5] == number))
                        {
                            result[position] = Math.Cos(i);
                            position++;
                        }
                    }
                    i++;
                }
                Console.WriteLine(string.Join("\n", result));

            }
            else
            {
                Console.WriteLine("Invalid input x must be 0 <= x < 10");
            }
        }
    }
}
