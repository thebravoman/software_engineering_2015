using System;

namespace Task4
{
    class Task4
    {
        static void Main()
        {
            int x = int.Parse(Console.ReadLine());
            int y = int.Parse(Console.ReadLine());
            int first = 0;
            int second = 1;
            int position = 1;
            int i = 1;
            while (true)
            {
                int a = recursion(first, second, position, i);
                if (a >= x)
                {
                    if (a < y)
                    {
                        Console.WriteLine(a);
                        i++;
                    }
                    else break;
                }
                else
                    i++;
            }
        }
        static int recursion(int first, int second,int position, int end)
        {
            int swap = first + second;
            first = second;
            second = swap;
            if (position == end)
                return second;
            else
            {
                position++;
                return recursion(first, second, position, end);
            }
        }
    }
}
