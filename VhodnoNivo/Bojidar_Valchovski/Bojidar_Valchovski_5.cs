using System;

namespace Bojidar_Valchovski_5
{
    class Program
    {
        static void Main()
        {
            Console.Write("Insert a value for X - ");
            int x = int.Parse(Console.ReadLine());
            double[] numbers = new double[10];
            if (x < 10 && x > 0)
            {
                for (int i = 0; i < 10; i++)
                {
                    double index = Convert.ToDouble(i);
                    numbers[i] = Math.Cos(index);
                }
                for (int i = 0; i < 10; i++)
                {
                    Console.WriteLine(numbers[i]);
                }
                for (int j = 0; j < 10 ; j++)
                    for (int k = j+1 ; k < 10 ; k++)
                        if (numbers[j] > numbers[k])
                        {
                            double temp = numbers[j];
                            numbers[j] = numbers[k];
                            numbers[k] = temp;
                        }
                Console.WriteLine("Sorted");
                for (int i = 0; i < 10; i++)
                {
                    Console.WriteLine(numbers[i]);
                }
            }
            Console.ReadKey();
        }
    }
}
