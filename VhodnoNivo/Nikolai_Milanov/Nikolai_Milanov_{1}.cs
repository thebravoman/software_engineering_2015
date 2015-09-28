using System;

namespace ProblemOne
{
    class ProblemOne
    {
        static void Main()
        {
            int x = int.Parse(Console.ReadLine());
            int y = int.Parse(Console.ReadLine());
            if (x > y)
            {
                Console.WriteLine("Invalid input x > y");
            }
            else
            {
                int sum = 0;
                for (int i = x; i < y; i++)
                {
                    if (i%2 != 0)
                        sum += i;
                }
                Console.WriteLine(sum);
            }
        }
    }
}
