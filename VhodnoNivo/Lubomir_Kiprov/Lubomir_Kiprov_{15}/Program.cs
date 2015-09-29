using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_15
{
    class Program
    {
        static void Main(string[] args)
        {
            int x;
            do
            {
                Console.WriteLine("Type number > 0 and number < 10");
                x = int.Parse(Console.ReadLine());
            } while (x < 1 || x > 9);
            int[] arr = new int[10];
            int counter = 0, sum = 0, permx = x; ;
            do
            {
                for (int i = 0; i < 1000; i++)
                {
                    if (i % x == 0)
                    {
                        sum += i;
                    }
                }
                arr[counter] = sum;
                sum = 0;
                counter++;
                x = permx*(counter + 1);
            } while (counter < arr.Length);
            Console.WriteLine();
            for (int i = 0; i < arr.Length; i++)
            {
                Console.WriteLine(arr[i]);
            }
        }
    }
}
