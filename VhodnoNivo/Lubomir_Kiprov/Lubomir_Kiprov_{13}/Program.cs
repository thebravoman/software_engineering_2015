using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_13
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

            double[] arr = new double[10];

            double sum = 0;
            for (int i = 0; i <= x; i++)
            {
                sum += Math.Cos(i);
            }
            arr[0] = sum;
            int counter = 1, copynumber = x, Nnumber = (counter + 1) * x;
            do
            {
                sum = 0;
                for (; copynumber <= Nnumber; copynumber++)
                {
                    sum += Math.Cos(copynumber);   
                }
                arr[counter] = sum;
                counter++;
                Nnumber = (counter + 1) * x;
            } while (counter < arr.Length);
            for (int i = 0; i < arr.Length; i++)
            {
                Console.WriteLine(arr[i]);
            }
        }
    }
}
