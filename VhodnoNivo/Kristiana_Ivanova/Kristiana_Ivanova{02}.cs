using System;
class problem
{
    static void Main()
    {

        int sum = 0;
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
            if (i % 17 == 0)
            {
                sum = sum + i;
            }
        }
        Console.WriteLine("Sum is: {0}", sum);
    }

}
