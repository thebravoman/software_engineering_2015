using System;

namespace Divisitors
{
    class Program
    {
        public static void GetDivisitor(int num)
        {
            for (int i = 2; i <= num/2; i++)
            {
                if (num % i == 0)
                {
                    Console.WriteLine(i);
                }
            }
        }
        static void Main(string[] args)
        {
            int num = 0;
            num = int.Parse(Console.ReadLine());
            GetDivisitor(num);
            Console.ReadLine();
        }
}
}
