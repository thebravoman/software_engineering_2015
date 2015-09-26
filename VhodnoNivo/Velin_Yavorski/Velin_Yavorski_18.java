import java.util.Scanner;
class Velin_Yavorski_18 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int x, times = 0;
		int arr[] = new int[10];
		
		System.out.println("Vavedi x (x > 0): ");
		x = scan.nextInt();
		while(x <= 0){
			System.out.println("Vavedi x (x > 0: ");
			x = scan.nextInt();
		}
		
		for(int counter2 = 3; counter2 < 9999999; counter2+=2){
			if(x % counter2 == 0){
				arr[times] = counter2;
				times++;
				if(times == 10)
					break;
			}
		}
		System.out.println("Purvite 10 nechetni chisla deliteli na x sa: ");
		for(int counter = 0; counter < 10; counter++)
			System.out.println(arr[counter]);
		
		System.out.println("-----------------------------------------------");
		System.out.println("Ot tqh prosti sa: ");
		
		for(int counter = 0; counter < 10; counter++){
			times = 0;
			for(int counter2 = 2; counter2 <= arr[counter]; counter2++){
				if(arr[counter] % counter2 == 0)
					times++;
			}
			if(times == 1)
				System.out.print(arr[counter] + ", ");
		}
	}
}
