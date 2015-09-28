using System;

class Problem6
{

    static void Main()
    {
        Console.Write("x = ");
        string line = Console.ReadLine();
        int x = int.Parse(line);

        int[] numbers = new int[100];
        int index = 0;
        int startIndex = 0;
        int container = 0;
        int container1 = 0;
        Random random = new Random();
        for (int i = 0; i < numbers.Length; i++)
        {
            numbers[i] = random.Next(0, 100);
        }
        for (int i = 0; i < numbers.Length; i++)
        {
            if (numbers[i] % 10 == x)
            {
                container = numbers[i];
                index = i;
                container1 = numbers[startIndex];

                numbers[startIndex] = container;
                numbers[i] = container1;

                startIndex++;

            }
        }

        Console.WriteLine("");
        for (int i = 0; i < numbers.Length; i++)
        {
            Console.WriteLine(numbers[i]);
        }
    }
}