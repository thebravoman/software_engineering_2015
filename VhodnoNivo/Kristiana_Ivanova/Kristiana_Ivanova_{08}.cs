using System;

class Problem8
{
    static void Main()
    {
        Console.Write("x = ");
        string line = Console.ReadLine();
        int x = int.Parse(line);

        int[] numbers = new int[10];
        int elementsNumber = 0;
        bool ok = false;
        Random random = new Random();
        for (int i = 0; i < numbers.Length; i++)
        {
            while (!ok)
            {
                int number = random.Next(0, 101);
                if (number > x)
                {
                    numbers[i] = number;
                    ok = true;
                }
            }
            ok = false;
        }

        for (int i = 0; i < numbers.Length; i++)
        {
            if (numbers[i] % 2 == 0)
            {
                elementsNumber++;
            }
        }

        int[] result = new int[elementsNumber];
        int j = 0;

        for (int i = 0; i < numbers.Length; i++)
        {
            if (numbers[i] % 2 == 0)
            {
                result[j] = numbers[i];
                j++;
            }
        }

        Console.WriteLine();
        foreach (int element in numbers)
        {
            Console.WriteLine(element);
        }
        Console.WriteLine();
        foreach (int element in result)
        {
            Console.WriteLine(element);
        }
    }
}