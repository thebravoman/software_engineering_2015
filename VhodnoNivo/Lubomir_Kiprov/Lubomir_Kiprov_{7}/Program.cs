using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_7
{
    class Program
    {
        static void Main(string[] args)
        {
            int x;
            do
            {
                Console.WriteLine("Type number > 0 or number < 100");
                x = int.Parse(Console.ReadLine());
            } while (x < 1 || x > 99);
            int[] arr = new int[10];
            int[] arr1 = new int[5];
            int testvalue;
            for (int i = 0; i < arr.Length; i++)
            {
                testvalue = int.Parse(Console.ReadLine());
                if (testvalue <= x)
                {
                    Console.WriteLine("Input some number > x");
                    i--;
                }
                else
                {
                    arr[i] = testvalue;
                }
            }
            int counter = 0 , counter1 = 0;
            do
            {
                arr1[counter] = arr[counter1 + 1];
                counter1 += 2;
                counter++;
            } while (counter < 5);
            Console.WriteLine();
            for (int i = 0; i < arr1.Length; i++)
            {
                Console.WriteLine(arr1[i]);
            }
        }
    }
}
