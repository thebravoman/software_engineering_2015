using System;
using System.Collections.Generic;

class Task4
{
    static List<int> FibonacciNumbers(int number)
    {
        List<int> fibonacciNumbers = new List<int>();
        fibonacciNumbers.Add(1);
        fibonacciNumbers.Add(1);
        int i = 1;
        while(fibonacciNumbers[i] <= number)
        {
            fibonacciNumbers.Add(fibonacciNumbers[i] + fibonacciNumbers[i - 1]);
            i++;
        }
        return fibonacciNumbers;
    }

    static void Main()
    {
        int x = int.Parse(Console.ReadLine());
        int y = int.Parse(Console.ReadLine());
        List<int> fibonacciNumbers = FibonacciNumbers(y);
        foreach (int element in fibonacciNumbers)
        {
            if(element >= x && element <=y)
            {
                Console.WriteLine(element);
            }
        }
    }
}
