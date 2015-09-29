import java.util.Scanner;
class Velin_Yavorski_16 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int arr[] = new int[10];
		int x,times,num = 0;
		
		System.out.println("Vavedi x (0 < x < 10) : ");
		x = scan.nextInt();
		while(x >= 10 || x <= 0){
			System.out.println("Vavedi x (0 < x < 10) : ");
			x = scan.nextInt();
		}

		for(int counter = 2; counter <= 1000; counter++){
			times = 0;
			for(int counter2 = 2; counter2 <= counter; counter2++){
				if(counter % counter2 == 0)
					times++;
			}
			if((times == 1) && (counter % 10 == x)){
				arr[num] = counter;
				num++;
			}
			if(num == 10)
				break;
		}
		
		for(int counter = 0; counter < 10; counter++)
			System.out.println(arr[counter]);
	}

}
