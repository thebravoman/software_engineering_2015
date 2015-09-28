using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_18
{
    class Program
    {
        static void Main(string[] args)
        {
            int x;
            do
            {
                Console.WriteLine("Type number >= 0");
                x = int.Parse(Console.ReadLine());
                if (x % 2 == 0)
                {
                    Console.WriteLine("There is not an odd number, that is divisible by the even ");
                    x = -1;
                }
            } while (x < 0);
            int[] arr = new int[10];
            int number = x, i = 0;
            do
            {
                if (number % x == 0)
                {
                    if (number % 2 != 0)
                    {
                        arr[i] = number;
                        i++;
                    }
                }
                number++;
            } while (i < arr.Length);
            for (int j = 0; j < arr.Length; j++)
            {
                Console.WriteLine(arr[j]);
            }
            bool haveprime = false;
            Console.WriteLine();
            Console.WriteLine();
            for (int j = 0; j < arr.Length; j++)
            {
                bool prime = IsPrime(arr[j]);
                if (prime == true)
                {
                    Console.WriteLine(arr[j]);
                    haveprime = true;
                }
            }
            if (haveprime == false)
            {
                Console.WriteLine("There is not prime numbers");
            }
            
        }

        private static bool IsPrime(int number)
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
