using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem_6
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
            int[] arr = new int[100];
            Random rand = new Random();
            for (int i = 0; i < arr.Length; i++)
            {
                arr[i] = rand.Next(0, 100);
            }
            int count = 0, temp;
            for (int i = 0; i < arr.Length; i++)
            {
                if (arr[i] % 10 == 4)
                {
                    temp = arr[count];
                    arr[count] = arr[i];
                    arr[i] = temp;
                    count++;
                }
            }
            for (int i = 0; i < arr.Length; i++)
            {
                Console.WriteLine(arr[i]);
            }
        }
    }
}
