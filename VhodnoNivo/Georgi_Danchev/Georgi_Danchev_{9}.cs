using System;

namespace Task9
{
    class Task9
    {
        static void Main()
        {
            int x = int.Parse(Console.ReadLine());

            if (x >= 0 && x < 10)
            {
                double[] numbers = new double[10];
                string cosineNum;
                double counter = 1;
                int foundMatches = 0;
                bool finished = false;
                bool flag = true;
                while (finished != flag)
                {
                    double result = Math.Cos(counter);
                    if (result < 0)
                    {
                        cosineNum = Convert.ToString(result);
                        string thirdElement = cosineNum.Substring(5, 1);
                        if (Convert.ToInt32(thirdElement) == x)
                        {
                            foundMatches++;
                            numbers[foundMatches - 1] = result;
                        }
                    }
                    else
                    {
                        cosineNum = Convert.ToString(result);
                        string thirdElement = cosineNum.Substring(4, 1);
                        if (Convert.ToInt32(thirdElement) == x)
                        {
                            foundMatches++;
                            numbers[foundMatches - 1] = result;
                        }
                    }
                    if (foundMatches == 10)
                        finished = true;
                    else
                        counter++;
                }
                for (int i = 0; i < numbers.Length; i++)
                {
                    Console.WriteLine(numbers[i]);
                }
            }
        }
    }
}