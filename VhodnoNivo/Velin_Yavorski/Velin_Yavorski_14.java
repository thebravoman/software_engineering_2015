import java.util.Scanner;
class Velin_Yavorski_14 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int arr[] = new int[10];
		int x,save = 1;
		
		System.out.println("Vavedi x (0 < x < 10): ");
		x = scan.nextInt();
		while(x >= 10 || x <= 0){
			System.out.println("Vavedi x (0 < x < 10): ");
			x = scan.nextInt();
		}
		
		for(int counter = 0; counter < 10; counter++)
			for(int counter2 = save; counter2 < 999999; counter2 ++){
				if(counter2 % x == 0){
					for(int counter3 = 0; counter3 <= counter2; counter3++){
						arr[counter]+=counter3;
					}
					save = counter2 + 1;
					break;
				}
			}
	
		for(int counter = 0; counter < 10; counter++)
			System.out.println(arr[counter]);
	}

}
