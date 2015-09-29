import java.util.Scanner;

public class Victoria_Admasu_2 
{
	public static void main(String[] args) 
	{
		Scanner input = new Scanner (System.in);
		
		System.out.print("Input x: ");
		int x = input.nextInt();
		
		System.out.print("Input y(y > x): ");
		int y = input.nextInt();
		
		while (y <= x)
		{
			System.out.print("Input y(y > x): ");
			y = input.nextInt();
		}
		
		int sum = 0;
		
		while (y >= x)
		{
			if (y % 17 == 0) 
			{
				sum += y;
				y -= 17;
			}
			else y--;
		}
		
		System.out.print("Sum: " + sum);
	}
}