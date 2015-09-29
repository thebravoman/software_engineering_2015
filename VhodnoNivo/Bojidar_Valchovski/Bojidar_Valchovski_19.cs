using System;

namespace Bojidar_Valchovski_19
{
    class Program
    {
        static void Main()
        {
            Console.Write("Insert a value for X - ");
            double x = double.Parse(Console.ReadLine());

            if (x > 0 && x < 1)
            {
                bool found = false;
                int num = 2;
                double curr_prime = 2;
                double prev_prime = -1;

                while(!found)
                {
                    if (numIsPrime(num))
                        curr_prime = num;
                    if (curr_prime - prev_prime == 2)
                    {
                        double result = (1 / prev_prime) + (1 / curr_prime);
                        if (result < x)
                        {
                            found = true;
                            Console.WriteLine("1/{0} + 1/{1} = {2} < x ", prev_prime,curr_prime,result);
                            break;
                        }
                    }
                    prev_prime = curr_prime;
                    num++;
                }
            }
            else
                Console.WriteLine("Invalid input! X must be greater than 0 and less than 1!");
            Console.ReadKey();
        }
        static bool numIsPrime(int i)
        {
            if (i == 1)
                return false;
            if (i == 2)
                return true;

            if (i % 2 == 0)
                return false;

            for (int counter = 3; counter < i; counter += 2)
                if (i % counter == 0)
                    return false;

            return true;
        }
    }
}
