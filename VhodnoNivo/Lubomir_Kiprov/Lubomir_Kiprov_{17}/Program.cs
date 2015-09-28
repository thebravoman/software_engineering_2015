using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Numerics;

namespace Problem_17
{
    class Program
    {
        static void Main(string[] args)
        {
            int x;
            do
            {
                Console.WriteLine("Type number > 0 or number < 10");
                x = int.Parse(Console.ReadLine());
            } while (x < 1 || x > 9);
            BigInteger[] arr = new BigInteger[10];

            BigInteger fibonaci_number1 = 1, fibonaci_number2 = 1, sum = 0;
            int counter = 0;
            do
            {
                sum = fibonaci_number1 + fibonaci_number2;
                fibonaci_number1 = fibonaci_number2;
                fibonaci_number2 = sum;
                if (sum.ToString().EndsWith(x.ToString()))
                {
                    arr[counter] = sum;
                    counter++;
                }
            } while (counter < arr.Length);
            for (int i = 0; i < arr.Length; i++)
            {
                Console.WriteLine(arr[i]);
            }
        }
    }
}
