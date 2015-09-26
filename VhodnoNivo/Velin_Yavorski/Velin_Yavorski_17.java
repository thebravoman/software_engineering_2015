import java.util.Scanner;
class Velin_Yavorski_17 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int arr[] = new int[10];
		int x, save = 0, times = 0;
		int fib1 = 1, fib2 = 1, fib3 = 0;

		System.out.println("Vavedi x (0 < x < 10): ");
		x = scan.nextInt();
		while(x >= 10 || x <= 0){
			System.out.println("Vavedi x (0 < x < 10): ");
			x = scan.nextInt();
		}
		
		for(int counter = 1; counter <= 999999; counter++){
			fib3 = fib1 + fib2;
			fib1 = fib2;
			fib2 = fib3;
			if(fib3 % 10 == x){
				arr[times] = fib3;
				times++;
			}
			if(times == 10)
				break;
		}
		
		for(int counter = 0; counter < 10; counter++)
			System.out.println(arr[counter]);
	}

}
