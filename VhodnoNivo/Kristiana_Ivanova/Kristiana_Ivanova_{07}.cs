using System;

class Problem7
{
    static void Main()
    {
        Random random = new Random();
	
	bool ok = false;
        int new_Numbers_Index = 0;
	
	Console.Write("x = ")
	string line = Console.ReadLine();
        int x = int.Parse(line);

        int[] numbers = new int[10];
        for (int i = 0; i < numbers.Length; i++)
        {
            while (!ok)
            {
                int number = random.Next(0, 101);
                if (number > x)
                {
                    numbers[i] = number;
                    ok = true;
                }
            }
            ok = false;
        }

        int[] newNumbers = new int[5];

        for (int i = 0; i < numbers.Length; i++) {

            if (i % 2 == 1) {

                newNumbers[newNumbersIndex] = numbers[i];
                new_Numbers_Index++;
            }
        }
        Console.WriteLine();
        
        foreach (int element in newNumbers) {

            Console.WriteLine(element);
        }
    }
}
