import java.util.Scanner;
import java.util.Random;

public class Victoria_Admasu_6 
{
	public static void main(String[] args) 
	{
		Scanner input = new Scanner (System.in);
		Random random = new Random();

		System.out.print("Input x(0 < x < 10): ");
		int x = input.nextInt();
		
		while (x <= 0 || x >= 10)
		{
			System.out.print("Input x(0 < x < 10): ");
			x = input.nextInt();
		}
		
		int[] array = new int[100]; 
		int count;
		
		for (count = 0; count < 100; count++)
			array[count] = random.nextInt(100);
		
		int count2 = 0;
		int num = 0;
		
		for (count = 0; count < 100; count++)
		{
			if (array[count] % 10 == x)
			{
				num = array[count2];
				array[count2] = array[count];
				array[count] = num;
				count2++;
			}
		}
		
		for (count = 0; count < 100; count++)
			System.out.print(array[count] + " ");
	}
}