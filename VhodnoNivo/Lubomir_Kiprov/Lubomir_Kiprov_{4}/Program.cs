using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_4
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
            List<int> fibarr = new List<int>();

            int fibonaci_number1 = 1, fibonaci_number2 = 1;

            do
	        {
	            sum = fibonaci_number1 + fibonaci_number2;
                fibonaci_number1 = fibonaci_number2;
                fibonaci_number2 = sum;
            } while (sum < firstnumber);

            for (; sum <= secondnumber ;)
            {
                fibarr.Add(sum);
                sum = fibonaci_number1 + fibonaci_number2;
                fibonaci_number1 = fibonaci_number2;
                fibonaci_number2 = sum;
            }
            for (int i = 0; i < fibarr.Count; i++)
            {
                Console.WriteLine("Fibonacci number = {0}", fibarr[i]);
            }
        }
    }
}

