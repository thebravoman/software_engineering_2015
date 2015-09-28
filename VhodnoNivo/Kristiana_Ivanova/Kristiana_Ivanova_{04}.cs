using System;
using System.Collections.Generic;

class problem4
{
    static List<int> FibNum(int num)
    {
        List<int> FibNum = new List<int>();
        FibNum.Add(1);
        FibNum.Add(1);
        int i = 1;
        while (FibNum[i] <= num)
        {
            FibNum.Add(FibNum[i] + FibNum[i - 1]);
            i++;
        }
        return FibNum;
    }

    static void Main()
    {
        Console.Write("x = ");
        string line = Console.ReadLine();
        int x = int.Parse(line);

        Console.Write("y = ");
        line = Console.ReadLine();
        int y = int.Parse(line);

        if (y < x)
        {
            Console.WriteLine("Oooops, y < x");
        }

        List<int> FibonacciNum = FibNum(y);
        foreach (int number in FibonacciNum)
        {
            if (number >= x && number <= y)
            {
                Console.WriteLine(number);
            }
        }
    }
}