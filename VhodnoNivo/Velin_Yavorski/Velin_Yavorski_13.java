import java.util.Scanner;
class Velin_Yavorski_13 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		double arr[] = new double[10];
		int x;

		System.out.println("Vavedi x (0 < x <10):");
		x = scan.nextInt();
		while(x >= 10 || x <=0){
			System.out.println("Vavedi x (0 < x <10):");
			x = scan.nextInt();
		}
		
		for(int N = 0; N < 10; N++)
			for(int z = (N * x); z < ((N + 1) * x); z++){
				arr[N] = arr[N] + Math.cos(z);
			}
		
		System.out.println("------------------------------");
		for(int counter = 0; counter < 10; counter++)
			System.out.println(arr[counter]);
	}

}
