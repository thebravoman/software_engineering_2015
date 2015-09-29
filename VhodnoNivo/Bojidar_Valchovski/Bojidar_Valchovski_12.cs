using System;

namespace Bojidar_Valchovski_12
{
    class Program
    {
        static void Main()
        {
            int x, y, w, h;
            Console.WriteLine("Input a value for X - ");
            x = int.Parse(Console.ReadLine());
            Console.WriteLine("Input a value for Y - ");
            y = int.Parse(Console.ReadLine());
            Console.WriteLine("Input a value for W - ");
            w = int.Parse(Console.ReadLine());
            Console.WriteLine("Input a value for H - ");
            h = int.Parse(Console.ReadLine());

            if (x > 0 && y > 0 && w > 0 && h > 0)
            {
                int[] pos = new int[10];
                int widthAmount = x / w, heightAmount = y / h;
                int result = widthAmount * heightAmount;
                Console.WriteLine("Fits exactly {0} times!", result);
                for (int i = 1; i <= 10; i++)
                {
                    if (w * i > x)
                        break;
                    pos[i - 1] = w * i;
                }
                for (int i = 0; i < pos.Length; i++)
                {
                    if (pos[i] == 0) break;
                    Console.Write("{0}",pos[i] + "\t");
                }
                Console.WriteLine();
            }
            else
                Console.WriteLine("Invalid input, all values must be greater than 0!");
            Console.ReadKey();
        }
    }
}
