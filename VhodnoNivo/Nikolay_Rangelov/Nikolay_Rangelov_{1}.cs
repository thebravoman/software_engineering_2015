using System;

class Task1
{
    static void Main()
    {
        int x = int.Parse(Console.ReadLine());
        int y = int.Parse(Console.ReadLine());
        int sum = 0;
        for(int i = x; i <= y; i++)
        {
            if(i % 2 == 1)
            {
                sum = sum + i;
            }
        }
        Console.WriteLine("The sum is: {0}", sum);
    }
}
