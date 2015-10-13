using System;
class problem
{
    static void Main()
    {
        
        int odd_sum = 0;
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
          if ( i % 2 != 0)
          {
              odd_sum = odd_sum + i;
          }
        }
        Console.WriteLine("Sum is: {0}", odd_sum);
    }
}

