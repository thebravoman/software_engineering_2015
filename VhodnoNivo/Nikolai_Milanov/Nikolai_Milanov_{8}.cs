using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Problem8
{
    class ProblemEight
    {
        static void Main()
        {
            int num = int.Parse(Console.ReadLine());
            int[] result = new int[10];
            if (0 <= num && num < 10)
            {
                int first = 0;
                int second = 1;
                int position = 0;
                int swap;
                while (position < 10)
                {
                    if (second % num == 0)
                    {
                        result[position] = second;
                        position++;
                    }
                    swap = first + second;
                    first = second;
                    second = swap;
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
