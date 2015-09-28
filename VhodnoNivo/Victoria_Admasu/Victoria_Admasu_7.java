import java.util.Random;
import java.util.Scanner;

public class Victoria_Admasu_7 
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
		
		for (count = 0; count < 10; count++)
			array1[count] = random.nextInt(10000) + (x + 1);
		
		int[] array2 = new int[5];
		int i = 1;
		
		for (count = 0; count < 5; count++)
		{
				array2[count] = array1[i];
				i += 2;
		}
		
		System.out.println();
		System.out.print("Array 1: ");
		
		for (count = 0; count < 10; count++)
			System.out.print(array1[count] + "; ");
		
		System.out.println();
		System.out.print("Array 2: ");
		
		for (count = 0; count < 5; count++)
			System.out.print(array2[count] + "; ");
	}
}