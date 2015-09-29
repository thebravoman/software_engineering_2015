import java.util.Scanner;
import java.util.Random;

class Velin_Yavorski_08 {
		
		public static void main(String args[]){
				
				Scanner scan = new Scanner(System.in);
				Random rand = new Random();
				
				int x, i, counter = 0;
				int arr1[] = new int[10];
				
				
				System.out.println("Vavedi x (0 < x < 100): ");
				x = scan.nextInt();
				if(x <= 0 || x >= 100){
					System.out.println("Nevalidna stoinost !!!");
					x = scan.nextInt();
				}
		
				System.out.println("Masiv 1: ");
				for(i = 0; i < 10; i++){
					arr1[i] = (x + 1) + rand.nextInt(1000);
					System.out.print(arr1[i] + ", ");
					if(arr1[i] % 2 == 1){
						counter++;
					}
				}
				
				int arr2[] = new int[counter];
				counter = -1;
				System.out.println();
				System.out.println("Masiv 2: ");
				for(i = 0; i < 10; i++){
					if(arr1[i] % 2 == 1){
						counter++;
						arr2[counter] = arr1[i];
					}
				}
				for(i = 0; i < counter; i++)
					System.out.print(arr2[i] + ", ");
	}	
}