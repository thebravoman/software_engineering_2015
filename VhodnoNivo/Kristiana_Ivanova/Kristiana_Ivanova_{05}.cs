using System;

class Problem5
{
    static void Main()
    {

        double[] numbers;
        numbers = new double[10];

        for (int i = 0; i < numbers.Length; i++)
        {
            numbers[i] = Math.Cos(double.Parse(i.ToString()));
        }

        foreach (double element in numbers)
        {
            Console.WriteLine(element);
        }

        Console.WriteLine();
        Array.Sort(numbers);
        Array.Reverse(numbers);

        foreach (double element in numbers)
        {
            Console.WriteLine(element);
        }
    }
}