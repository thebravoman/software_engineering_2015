using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_9
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
            } while (x < 0 || x > 10);
            double[] arr = new double[10];
            int i = 0, cosargument = 1;
            string xconvert = x.ToString();
            do
            {
                string convert = Math.Cos(cosargument).ToString();
                if (convert[0] != '-')
                {
                    if (convert[4] == xconvert[0])
                    {
                        arr[i] = double.Parse(convert);
                        i++;
                    }
                }
                else
                {
                    if (convert[5] == xconvert[0])
                    {
                        arr[i] = double.Parse(convert);
                        i++;
                    }
                }
              
                cosargument++;
            } while (i < arr.Length);
            for (int j = 0; j < arr.Length; j++)
            {
                Console.WriteLine(arr[j]);
            }
        }
    }
}
