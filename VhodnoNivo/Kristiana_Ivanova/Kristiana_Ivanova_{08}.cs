using System;

class Problem8
{
    static void Main()
    {
        Console.Write("x = ");
        string line = Console.ReadLine();
        int x = int.Parse(line);

        int[] numbers = new int[10];
        int elements_Number = 0;
        bool ok = false;
        Random random = new Random();
        for (int i = 0; i < numbers.Length; i++)
 {
            while (!ok) {

                int number = random.Next(0, 101);
                if (number > x) {

                    numbers[i] = number;
                    ok = true;
                }
            }
            ok = false;
        }

        for (int i = 0; i < numbers.Length; i++) {

            if (numbers[i] % 2 == 0) {

                elements_Number++;
            }
        }

        int[] result = new int[elements_Number];
        int i_new = 0;

        for (int i = 0; i < numbers.Length; i++) {

            if (numbers[i] % 2 == 0) {

                result[i_new] = numbers[i];
                i_new++;
            }
        }

        Console.WriteLine();
        foreach (int element in numbers) {

            Console.WriteLine(element);
        }
        Console.WriteLine();
        foreach (int element in result) {

            Console.WriteLine(element);
        }
    }
}
