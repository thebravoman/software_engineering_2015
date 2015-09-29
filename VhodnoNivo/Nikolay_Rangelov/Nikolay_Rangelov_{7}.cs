using System;

class Task7
{
    static void Main()
    {
        Random random = new Random();
        int newNumbersIndex = 0;
        bool ok = false;
        int x = int.Parse(Console.ReadLine());
        int[] numbers = new int[10];
        for(int i = 0; i < numbers.Length; i++)
        {
            while(!ok)
            {
                int number = random.Next(0, 101);
                if(number > x)
                {
                    numbers[i] = number;
                    ok = true;
                }
            }
            ok = false;
        }

        int[] newNumbers = new int[5];

        for(int i = 0; i < numbers.Length; i++)
        {
            if(i % 2 == 1)
            {
                newNumbers[newNumbersIndex] = numbers[i];
                newNumbersIndex++;
            }
        }
        Console.WriteLine();
        /*foreach(int element in numbers)
        {
            Console.WriteLine(element);
        }
        Console.WriteLine();*/
        foreach (int element in newNumbers)
        {
            Console.WriteLine(element);
        }
    }
}

