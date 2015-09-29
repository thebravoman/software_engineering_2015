using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _03.LastNumber3
{
    class Program
    {
        static void Main(string[] args)
        {
            int x = int.Parse(Console.ReadLine());
            int y = int.Parse(Console.ReadLine());
            int sum = 0;
            for (int i = x; i <= y; i++)
            {
                if (i % 10 == 3)
                {
                    sum += i;
                }
            }
            Console.WriteLine(sum);
        }
    }
}
