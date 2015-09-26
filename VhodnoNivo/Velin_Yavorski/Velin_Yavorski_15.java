import java.util.Scanner;
class Velin_Yavorski_15 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int arr[] = new int[10];
		int x,save = 0;
		
		System.out.println("Vavedi x (0 < x < 10): ");
		x = scan.nextInt();
		while(x >= 10 || x <= 0){
			System.out.println("Vavedi x (0 < x < 10): ");
			x = scan.nextInt();
		}

		for(int counter = 0; counter < 10; counter++){
			save = (counter + 1) * x;
			for(int counter2 = 0; counter2 < 1000; counter2++){
				if(counter2 % save == 0){
					arr[counter]+=counter2;
				}
			}	
		}	
		
		for(int counter = 0; counter < 10; counter++)
			System.out.println(arr[counter]);
	}
}
