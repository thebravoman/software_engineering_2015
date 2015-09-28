using System;

namespace Task7
{
    class Task7
    {
        static void Main()
        {
            int x = int.Parse(Console.ReadLine());
	        int []arr1 = new int[10];
            Random random = new Random();

	        for(int i=0;i<10;i++) arr1[i] = ( random.Next(0, 1000) ) + x;
	        int [] arr2 = new int [5];
	        for(int i=0;i<5;i++) 
                arr2[i] = arr1[i*2+1];

	        for(int i=0;i<5;i++)
                Console.WriteLine(arr2[i]);
        }
    }
}
