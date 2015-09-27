using System;

class Task14
{
    static void Main()
    {
        int x = int.Parse(Console.ReadLine());
        int[] numbers = new int[10];
        int sum = 0;
        for (int i = 0; i <= x; i++)
        {
            sum = sum + i;
        }
        numbers[0] = sum;
        for (int i = 1; i < 10; i++)
        {
            sum = 0;
            for (int j = 0; j <= x*(i+1); j++)
            {
                sum = sum + j;
            }
            numbers[i] = sum;
        }

        foreach(int element in numbers)
        {
            Console.WriteLine(element);
        }
    }
}
