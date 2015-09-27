using System;

class task9
{
    static void Main()
    {
        int x = int.Parse(Console.ReadLine());
        int inputCos = 1;
        double[] numbers = new double[10];
        bool ok = false;
        for(int i = 0; i < 10; i++)
        {
            while (!ok)
            {
                double number = Math.Cos(inputCos);
                inputCos++;
                int thirdDigit = (int)((number*1000) % 10);

                if((number > 0.0f) && (thirdDigit == x))
                {
                    numbers[i] = number;
                    ok = true;
                }
            }
            ok = false;
        }

        foreach(double element in numbers)
        {
            Console.WriteLine(element);
        }
    }
}

