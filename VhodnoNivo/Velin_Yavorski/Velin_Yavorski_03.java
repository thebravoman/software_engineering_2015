import java.util.Scanner;
class Velin_Yavorski_03 {
	public static void main(String[] args) {
		
		int i = 0,counter = 1,x,y,k;
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
			x++;
			i = 0;
			counter = 2;
			while(counter <= x){
				if(x % counter == 0){
					i++;
				}
				counter++;
			}
			if(i == 1){
					k = x % 10;
					if(k == 3)
						System.out.println(x);
			}	
		}
	}

}
