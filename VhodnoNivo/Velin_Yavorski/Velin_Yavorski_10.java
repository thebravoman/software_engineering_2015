import java.util.Scanner;
class Velin_Yavorski_10 {

	public static void main(String[] args) {
		long arr[] = new long[10];
		long count[] = new long[10];
		Scanner scan = new Scanner(System.in);
		long x;
		long fib1 = 1;
		long fib2 = 1;
		long fib3 = 0;
		long times = 0;
		
		System.out.println("Vavedi x (0 < x < 10): ");
		x = scan.nextInt();
		while(x >= 10 || x <=0 ){
			System.out.println("Vavedi x (0 < x < 10): ");
			x = scan.nextInt();
		}
		
		System.out.println();
		
		for(int counter = 0; counter < 1000; counter++){
			fib3 = fib1 + fib2;
			fib1 = fib2;
			fib2 = fib3;
			if(fib3 % x == 0){
				arr[(int)times] = fib3;
				count[(int)times] = counter + 3;
				times++;	
				if(times == 10)
					break;
			}
				
		}
		
		for(int counter = 0; counter < 10; counter++){
			System.out.println(count[counter] + ": " + arr[counter]);
		}

	}

}
