import java.util.Scanner;
class Velin_Yavorski_09
{
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		double arr[] = new double[10];
		int x,times = 0;
		double d,dd;
		
		System.out.println("Vavedi x (0 < x < 10): ");
		x = scan.nextInt();
		while(x >= 10 || x <=0){
			System.out.println("Vavedi x (0 < x < 10): ");
			x = scan.nextInt();
		}

		for(int counter = 0; counter <= 1000; counter++){
			d = Math.cos(counter);
			dd = d;
			d = d*1000;
			if((int)d % 10 == x || (int)d % 10 == -x){
				if(times == 10)
					break;
				arr[times] = dd;	
				times++;
				
			}
		}
		
		for(int counter = 0; counter < 10; counter++){
			System.out.println(arr[counter]);
		}
	}

}
