using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_14
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
            int counter = 0, number = 1, sum = 0;
            do
            {
                if (number % x == 0)
	            {
		            for (int i = 1; i <= number; i++)
			        {
			             sum += i;
                    }
                    arr[counter] = sum;
                    counter++;
                    sum = 0;
                }
                number++;
            } while (counter < arr.Length);
            for (int i = 0; i < arr.Length; i++)
            {
                Console.WriteLine(arr[i]);
            }
        }
    }
}
