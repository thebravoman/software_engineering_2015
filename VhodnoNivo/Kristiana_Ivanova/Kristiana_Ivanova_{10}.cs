using System;
using System.Collections.Generic;

class Problem10
{
    static int NextFibNum(int x, int y)
    {
        return x + y;
    }

    static void Main()
    {
        int a = 0;
        int b = 1;
        bool True = false;

        Console.Write("x = ");
        string line = Console.ReadLine();
        int x = int.Parse(line);

        int Index = 0;
        int[] numbers = new int[10];
        int number1 = 1;

        List<int> numbersFib = new List<int>();
        numbersFib.Add(number1);
        numbersFib.Add(number1);
        for (int i = 0; i < numbers.Length; i++)
        {
            while (!True)
            {
                if (numbersFib[Index] % x == 0)
                {
                    numbers[i] = numbersFib[Index];
                    True = true;
                }
                Index++;
                numbersFib.Add(NextFibNum(numbersFib[a], numbersFib[b]));
                a++;
                b++;
            }
            True = false;
        }
        Console.WriteLine();
        foreach (int element in numbers)
        {
            Console.WriteLine(element);
        }
    }
}