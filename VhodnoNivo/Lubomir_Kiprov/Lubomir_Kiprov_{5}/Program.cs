using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_5
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
            double[] arr = new double[10];
            for (int i = 0; i < arr.Length; i++)
            {
                arr[i] = Math.Cos(i);
            }
            for (int i = 0; i < arr.Length; i++)
            {
                Console.WriteLine(arr[i]);
            }
            Array.Sort(arr);
            Array.Reverse(arr);
            Console.WriteLine();
            for (int i = 0; i < arr.Length; i++)
            {
                Console.WriteLine(arr[i]);
            }

        }
    }
}
