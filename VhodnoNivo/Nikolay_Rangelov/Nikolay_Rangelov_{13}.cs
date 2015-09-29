using System;

class Task13
{
    static void Main()
    {
        int x = int.Parse(Console.ReadLine());
        double[] numbers = new double[10];
        double result = 0.0d;
        for(int i = 0; i < x; i++)
        {
            result = result + Math.Cos(i);
        }
        numbers[0] = result;
        result = 0.0d;
        for (int i = x; i < 2*x; i++)
        {
            result = result + Math.Cos(i);
        }
        numbers[1] = result;

        for (int n = 2; n < 10; n++)
        {
            result = 0.0d;
            int from = n*x;
            int to = (n + 1) * x;
            for (int i = from; i < to; i++)
            {
                result = result + Math.Cos(i);
            }
            numbers[n] = result;
        }
        foreach(double element in numbers)
        {
            Console.WriteLine(element);
        }

    }
}
