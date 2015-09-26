import java.util.Scanner;
import java.util.Random;

class Velin_Yavorski_07 {
		
		public static void main(String args[]){
				
				Scanner scan = new Scanner(System.in);
				Random rand = new Random();
				
				int x, i, m = -1;
				int arr1[] = new int[10];
				int arr2[] = new int[5];
				
				System.out.println("Vavedi x (0 < x < 100): ");
				x = scan.nextInt();
				if(x < 0 || x > 100){
					System.out.println("Nevalidna stoinost !!!");
					x = scan.nextInt();
				}
		
				System.out.println("Masiv 1: ");
				for(i = 0; i < 10; i++){
					arr1[i] = (x + 1) + rand.nextInt(1000);
					System.out.print(arr1[i] + ", ");
				}
				
				System.out.println();
				System.out.println("Masiv 2: ");
				for(i = 0; i < 5; i++){
					m+=2;
					arr2[i] = arr1[m];
					System.out.print(arr2[i] + ", ");
				}
	}	
}