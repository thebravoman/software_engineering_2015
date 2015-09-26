import java.util.Random;
import java.util.Scanner;
class Velin_Yavorski_06 {

	public static void main(String[] args) {
		Random rand = new Random();
		Scanner scan = new Scanner(System.in);
		int x,broi = 0,save;
		int arr[] = new int[100];
		
		System.out.println("Vavedete x (0 < x < 10):");
		x = scan.nextInt();
		while(x >= 10 || x <=0){
			System.out.println("Vavedete x (0 < x < 10):");
			x = scan.nextInt();
		}
		
		for(int counter = 0; counter < 100; counter++)
			arr[counter] = rand.nextInt(99);
		
		for(int counter = 0; counter < 100; counter++)
				if(arr[counter] % 10 == x){
					save = arr[broi];
					arr[broi] = arr[counter];
					arr[counter] = save;
					broi++;
				}
		for(int counter = 0; counter < 100; counter++)
			System.out.println(arr[counter]);
	}

}
