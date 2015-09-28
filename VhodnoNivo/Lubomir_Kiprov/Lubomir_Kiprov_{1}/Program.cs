using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_1
{
    class Program
    {
        static void Main(string[] args)
        {
            int firstnumber, secondnumber, sum = 0;
            do
            {
                Console.WriteLine("Input two numbers (first have to be smallest than second)");
                firstnumber = int.Parse(Console.ReadLine());
                secondnumber = int.Parse(Console.ReadLine());
            } while (firstnumber > secondnumber);
            for (;  firstnumber < secondnumber; firstnumber++)
            {
                if (firstnumber % 2 != 0)
                {
                    sum += firstnumber;
                }
            }
            Console.WriteLine(sum);
        }
    }
}
