using System;

class Task17
{
    static int nextFibonacci(int x, int y)
    {
        return x+y;
    }

    static void Main()
    {
        int x = int.Parse(Console.ReadLine());
        int[] numbers = new int[10];
        int number1 = 1;
        int number2 = 1;
        int number3 = 0;
        int i = 0;
        while(i<10)
        {
            number3 = nextFibonacci(number1, number2);
            if(number3 % 10 == x)
            {
                numbers[i] = number3;
                i++;
            }
            number1 = number2;
            number2 = number3;
        }

        foreach(int element in numbers)
        {
            Console.WriteLine(element);
        }
    }
}

