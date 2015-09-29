using System;

class Task2
{
    static void Main()
    {
        int x = int.Parse(Console.ReadLine());
        int y = int.Parse(Console.ReadLine());
        int sum = 0;
        for(int i = x; i <= y; i++)
        {
            if(i % 17 == 0)
            {
                sum = sum + i;
            }
        }
        Console.WriteLine("Result: {0}", sum);
    }
}
