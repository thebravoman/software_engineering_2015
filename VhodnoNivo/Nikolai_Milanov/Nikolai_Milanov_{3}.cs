using System;

namespace Problem3
{
    class ProblemThree
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
                    string check = i.ToString();
                    if (Simple(i) && check[check.Length - 1] == '3')
                        sum += i;
                }
                Console.WriteLine(sum);
            }
        }

        static bool Simple(int a)
        {
            for (int i = 2; i < a; i++)
            {
                if (a%i == 0)
                    return false;

            }
            return true;
        }
    }
}
