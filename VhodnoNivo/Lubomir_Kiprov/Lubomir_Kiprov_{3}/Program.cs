using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_3
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
            for (; firstnumber < secondnumber; firstnumber++)
            {
                bool prime = IsPrime(firstnumber);
                if (prime == true)
                {
                    Console.WriteLine(firstnumber);
                }
            }
            
        }


        public static bool IsPrime(int number)
        {
            for (int i = 2; i < number; i++)
            {
                if (number % i == 0)
                {
                    if (i != number)
                    {
                        return false;
                    }
                    else
                    {
                        return true;
                    }
                }
            }
            return true;
        }
    }
}

