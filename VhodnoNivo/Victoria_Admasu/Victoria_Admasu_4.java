import java.util.Scanner;

public class Victoria_Admasu_4 
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
		
		int f = 0;
		int f1 = 1;
		int f2 = 1;
		
		if (x <= 0) 	
			System.out.print("0  1  1  ");
		
		if (x == 1)
			System.out.print("1  1  ");
		
		for (int c = 0; c <= y; c++)
		{
			f = f1 + f2;
			f1 = f2;
			f2 = f;
			
			if (f >= x && f <= y)
				System.out.print(f + "  ");
		}
	}
}