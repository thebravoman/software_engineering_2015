using System;
using System.Collections.Generic;

class Task10
{
    static int NextFibonacci(int x, int y)
    {
        return x + y;
    }

    static void Main()
    {
        int a = 0;
        int b = 1;
        bool ok = false;
        int x = int.Parse(Console.ReadLine());
        int numbersFibIndex = 0;
        int[] numbers = new int[10];
        int number1 = 1;
        int number2 = 1;
        List<int> numbersFib = new List<int>();
        numbersFib.Add(number1);
        numbersFib.Add(number1);
        for(int i = 0; i < numbers.Length; i++)
        {
            while(!ok)
            {
                if(numbersFib[numbersFibIndex] % x == 0)
                {
                    numbers[i] = numbersFib[numbersFibIndex];
                    ok = true;
                }
                numbersFibIndex++;
                numbersFib.Add(NextFibonacci(numbersFib[a], numbersFib[b]));
                a++;
                b++;
            }
            ok = false;
        }
        Console.WriteLine();
        foreach(int element in numbers)
        {
            Console.WriteLine(element);
        }
    }
}

