using System;

class Task15
{
    static void Main()
    {
        int x = int.Parse(Console.ReadLine());
        int[] numbers = new int[10];
        int sum = 0;
        for (int i = 0; i < 1000; i++)
        {
            if(i % x == 0)
            {
                sum = sum + i;
            }
        }
        numbers[0] = sum;
        sum = 0;
        for (int i = 0; i < 1000; i++)
        {
            if (i % (2 * x) == 0)
            {
                sum = sum + i;
            }
        }
        numbers[1] = sum;
        for (int j = 2; j < 10; j++)
        {
            sum = 0;
            for (int i = 0; i < 1000; i++)
            {
                if (i % ((j+1) * x) == 0)
                {
                    sum = sum + i;
                }
            }
            numbers[j] = sum;
        }

        foreach(int element in numbers)
        {
            Console.WriteLine(element);
        }
    }
}
