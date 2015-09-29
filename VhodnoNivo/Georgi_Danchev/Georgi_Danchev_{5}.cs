using System;

namespace Task5
{
    class Task6
    {
        static void Main()
        {
            int x = int.Parse(Console.ReadLine());
            int [] arr = new int[100];
            int temp;
            int xIndex = 0;
            Random randomNumber = new Random();
            for (int i = 0; i < arr.Length; i++ )
            {
                arr[i] = randomNumber.Next(0, 100);
                if (arr[i] % 10 == x)
                {
                    temp = arr[xIndex];
                    arr[xIndex] = arr[i];
                    arr[i] = temp;
                    xIndex++;
                }
            }
            for (int i = 0; i < arr.Length; i++)
            {
                Console.WriteLine(arr[i]);
            }
        }
    }
}
