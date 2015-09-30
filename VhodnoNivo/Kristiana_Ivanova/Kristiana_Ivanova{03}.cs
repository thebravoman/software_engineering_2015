using System;
class Problem
{
    public static bool Prime(int number)
    {
        if (number == 2)
        {
            return true;
        }
        else if (number == 1)
        {
            return false;
        }
        for (int i = 2; i <= number / 2; i++)
        {
            if (number % i == 0)
            {
                return false;
            }
        }
        return true;
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
            Console.WriteLine("Ooops, y < x");
        }

        for (int i = x; i <= y; i++)
        {
            if (Prime(i) == true)
            {
                if (i == 3)
                {
                    Console.WriteLine(i);
                }

                else if (i > 10 && i < 100)
                {
                    if (i % 10 == 3)
                    {
                        Console.WriteLine(i);
                    }
                }

                else if (i > 100)
                {
                    if (i % 100 == 3)
                    {
                        Console.WriteLine(i);
                    }
                }
            }
        }
        
    }
}
