using System;

class Task12
{
    static void Main()
    {
        Console.Write("x = ");
        string line = Console.ReadLine();
        int x = int.Parse(line);

        Console.Write("y = ");
         line = Console.ReadLine();
        int y = int.Parse(line);

        Console.Write("w = ");
        line = Console.ReadLine();
        int w = int.Parse(line);

        Console.Write("h = ");
        line = Console.ReadLine();
        int h = int.Parse(line);

        int[] numbers = new int[10];

        for (int i = 0; i < numbers.Length; i++)
        {
            numbers[i] = 0;
        }

        if ((h <= x && w <= y) || (w <= x && h <= y))
        {
            if ((h == x && w == y) || (w == x && h == y))
            {
                Console.WriteLine("without");
            }
            else
            {
                if ((h < x && w < y) && (w < x && h < y))
                {
                    int a = x / h;
                    int b = x / w;
                    if (a == b || a > b)
                    {
                        for (int i = 0; (i < a && i < 10); i++)
                        {
                            if (i == 0)
                            {
                                numbers[i] = h;
                            }
                            else
                            {
                                numbers[i] = numbers[i - 1] + h;
                            }
                        }

                    }
                    else if (b > a)
                    {
                        for (int i = 0; (i < b && i < 10); i++)
                        {
                            if (i == 0)
                            {
                                numbers[i] = w;
                            }
                            else
                            {
                                numbers[i] = numbers[i - 1] + w;
                            }
                        }
                    }
                }
            }
            Console.WriteLine();
            foreach (int element in numbers)
            {
                Console.WriteLine(element);
            }
        }
        else
        {
            Console.WriteLine("False");
        }
    }
}