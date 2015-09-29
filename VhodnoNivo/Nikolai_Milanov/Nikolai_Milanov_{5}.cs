using System;

namespace Problem5
{
    class ProblemFive
    {
        static void Main()
        {
            int x = int.Parse(Console.ReadLine());
            if (0 < x && x < 10)
            {

                double[] array = new double[10];
                for (int i = 0; i < 10; i++)
                {
                    array[i] = Math.Cos(i);
                }
                print(array);
                Array.Sort(array);
                Array.Reverse(array);
                Console.WriteLine();
                print(array);
            }
            else
            {
                Console.WriteLine("Invalid input x must be 0 < x < 10");
            }
        }

        static void print(double[] array)
        {
            for (int i = 0; i < array.Length; i++)
            {
                Console.WriteLine(array[i]);
            }
        }
    }
}
