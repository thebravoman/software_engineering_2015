import java.util.Scanner;
class Velin_Yavorski_01 {
	public static void main(String args[]){
		
		int x,y,sum = 0;
		Scanner velioo = new Scanner(System.in);
		System.out.println("Enter x: ");
		x = velioo.nextInt();
		System.out.println("Enter y (y > x): ");
		y = velioo.nextInt();
		while(y < x){
			System.out.println("Y must be bigger than X !!!");
			System.out.println("Enter y (y > x): ");
			y = velioo.nextInt();
		}
		while(x <= y){
			if(x % 2 == 1){
				sum = sum + x;
			}
			x++;
		}
		System.out.println(sum);
	}
}
