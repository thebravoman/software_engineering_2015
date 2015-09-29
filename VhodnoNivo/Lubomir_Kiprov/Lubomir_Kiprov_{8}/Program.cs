using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_8
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
            List<int> arr1 = new List<int>();
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
            for (int i = 0; i < arr.Length; i++)
            {
                if (arr[i] % 2 != 0)
                {
                    arr1.Add(arr[i]);
                    continue;
                }
            }

            if (arr1.Count != 0)
            {
                for (int i = 0; i < arr1.Count; i++)
                {
                    Console.WriteLine(arr1[i]);
                }
            }
            else
            {
                Console.WriteLine("Array is empty");
            }

        }
    }
}
