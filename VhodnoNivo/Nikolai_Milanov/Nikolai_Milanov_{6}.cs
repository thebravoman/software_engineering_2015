using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Problem6
{
    class ProblemSix
    {
        static void Main()
        {
            int num = int.Parse(Console.ReadLine());
            if (0 < num && num < 10)
            {
            
                Random rand = new Random();
                int input;
                List<int> first = new List<int>();
                List<int> secont = new List<int>();
                for (int i = 0; i < 100; i++)
                {
                    input = rand.Next(1, 100);
                    if (input%10 == num)
                    {
                        first.Add(input);
                    }
                    else secont.Add(input);
                }
                Console.WriteLine(string.Join(" ", first) + " " + string.Join(" ", secont));

            }
            else
            {
                Console.WriteLine("Invalid input x must be 0 < x < 10");
            }
        }
    }
}
