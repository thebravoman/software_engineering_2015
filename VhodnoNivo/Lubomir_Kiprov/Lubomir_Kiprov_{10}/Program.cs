using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_10
{
    class Program
    {
        static void Main(string[] args)
        {
            int x;
            do
            {
                Console.WriteLine("Type number >= 0 or number < 10");
                x = int.Parse(Console.ReadLine());
            } while (x < 0 || x > 9);
            ulong[] arr = new ulong[10];
            ulong fibonaci_number1 = 1, fibonaci_number2 = 1, sum = 0, i = 0;
            do
            {
                sum = fibonaci_number1 + fibonaci_number2;
                fibonaci_number1 = fibonaci_number2;
                fibonaci_number2 = sum;
                if (sum % Convert.ToUInt64(x) == 0 )
                {
                    arr[i] = sum;
                    i++;
                }
            } while (i < Convert.ToUInt64(arr.Length));
            Console.WriteLine();
            for (int j = 0; j < arr.Length; j++)
            {
                Console.WriteLine(arr[j]);
            }
        }
    }
}
