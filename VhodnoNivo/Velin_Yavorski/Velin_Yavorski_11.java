import java.util.Scanner;

class Velin_Yavorski_11 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		double x;
		double pi = 4;
		double delnum = 1;
		
		System.out.println("Vavedi x (0 < x < 1): ");
		x = scan.nextDouble();
		while(x >= 1 || x <= 0){
			System.out.println("Vavedi x (0 < x < 1): ");
			x = scan.nextDouble();
		}
		
		for(int counter = 3; counter < 1000; counter++){
			delnum+=2;
			if(4/delnum < x)
				break;
			if(counter % 2 == 1){
				pi = pi - 4/delnum;
			}
			else{
				pi = pi + 4/delnum;
			}
			
		}
		System.out.println(pi);
	}

}
