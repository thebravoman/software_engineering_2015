using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_16
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
                if (x % 2 == 0)
                {
                    Console.WriteLine("x is an even number, there is not simple number, that edns with x");
                    x = -1;
                }
                if (x == 5)
                {
                    Console. WriteLine("5 is the only one ,that ends with 5");
                    x = -1;
                }
            } while (x < 1 || x > 9);

            int[] arr = new int[10];
            int number = 1, counter = 0;
            do
            {
                #region
                //for (; i < number; i++)
                //{
                //    if (number % i == 0)
                //    {
                //        if (i != number)
                //        {
                //            simple = false;
                //            break;
                //        }
                        
                //    }
                //}
                //if (i == number)
                //{
                //    simple = true;
                //}
                
                //if (simple == true)
                //{
                //    string endwithx = number.ToString();
                //    if (endwithx.EndsWith(x.ToString()))
                //    {
                //        arr[counter] = number;
                //        counter++;
                //    }
                //}
                #endregion
                bool prime = Prime.IsPrime(number);
                if (prime == true)
                {
                    if (number.ToString().EndsWith(x.ToString()))
                    {
                        arr[counter] = number;
                        counter++;
                    }
                }
                number++;
            } while (counter < arr.Length);
            for (int j = 0; j < arr.Length; j++)
            {
                Console.WriteLine(arr[j]);
            }
        }
    }
}
