import java.util.Scanner;

public class Victoria_Admasu_3 
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
		
		boolean isPrime;
		
		while (x <= y)
		{
			isPrime = true;
			if (x % 10 == 3) 
			{
				for (int c = 2; c < x; c++)
				{
					if (x % c == 0)	
					{
						isPrime = false;
						break;
					}
				}
				
				if (isPrime == true) 
					System.out.print(x + " ");
				
				x += 10;
			}
			else x++;
		}
	}
}