import java.util.Scanner;
class Velin_Yavorski_04 {
	public static void main(String[] args) {
		
		Scanner velioo = new Scanner(System.in);
		int x,y;
		int fib1 = 1;
		int fib2 = 1;
		int fib3 = 0;
		
		System.out.println("Vavedete x: ");
		x = velioo.nextInt();
		System.out.println("Vavedete y (y > x): ");
		y = velioo.nextInt();
		while(x > y){
			System.out.println("'y' trqbwa da e po-golqmo ot x ! ");
			System.out.println("Vavedete y (y > x): ");
			y = velioo.nextInt();
		}
		
		if(x <= 1){
			System.out.println(fib1);
			System.out.println(fib2);
		}
			for(int counter = 0; counter < 100; counter++){
				fib3 = fib1 + fib2;
				fib1 = fib2;
				fib2 = fib3;
				if(fib3 > y)
					break;
				if(fib3 > x)
					System.out.println(fib3);
				
			}
			
	}

}


