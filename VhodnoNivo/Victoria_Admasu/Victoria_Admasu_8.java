import java.util.Random;
import java.util.Scanner;

public class Victoria_Admasu_8 
{
	public static void main(String[] args) 
	{
		Scanner input = new Scanner (System.in);
		Random random = new Random();

		System.out.print("Input x(0 < x < 100): ");
		int x = input.nextInt();
		
		while (x <= 0 || x >= 100)
		{
			System.out.print("Input x(0 < x < 100): ");
			x = input.nextInt();
		}
		
		int[] array1 = new int[10];
		int count;
		int count2 = 0;
		
		for (count = 0; count < 10; count++)
		{
			array1[count] = random.nextInt(10000) + (x + 1);
			
			if (array1[count] % 2 == 1)
				count2++;
		}
		
		int[] array2 = new int[count2];
		int i = 0;
		
		for (count = 0; count < 10; count++)
		{
				if (array1[count] % 2 == 1)
				{	
					array2[i] = array1[count];
					i++;
				}
		}
		
		System.out.println();
		System.out.print("Array 1: ");
		
		for (count = 0; count < 10; count++)
			System.out.print(array1[count] + "; ");
		
		System.out.println();
		System.out.print("Array 2: ");
		
		for (count = 0; count < count2; count++)
			System.out.print(array2[count] + "; ");
	}
}