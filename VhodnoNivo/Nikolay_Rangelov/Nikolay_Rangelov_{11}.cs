using System;

class Task11
{
    static void Main()
    {
        double x = double.Parse(Console.ReadLine());
        double resultPi = 4.0d;
        double n = 3.0d;
        int i = 1;
        while(true)
        {
            if (i % 2 == 0)
            {
                resultPi = resultPi + (4.0d / n);
            }
            else
            {
                resultPi = resultPi - (4.0d / n);
            }
            if(4.0d/n<x)
            {
                break;
            }
            n++;
            i++; 
        }
        Console.WriteLine(resultPi);
    }
}

