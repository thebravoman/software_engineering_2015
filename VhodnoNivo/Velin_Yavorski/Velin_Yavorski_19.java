import java.util.Scanner;
class Velin_Yavorski_19 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		double x;
		double prime1 = 1;
		double prime2 = 3;
		int times1 = 0;
		int times2 = 0;
		double save = 0;
		
		System.out.println("Vavedi x (0 < x < 1): ");
		x = scan.nextDouble();
		
		for(int counter = 1; counter <= 999999; counter++){
			prime1+=2;
			prime2+=2;
			times1 = 0;
			times2 = 0;
			for(int counter2 = 2; counter2 <= prime1; counter2++){
				if(prime1 % counter2 == 0)
					times1++;	
			}
			
			for(int counter2 = 2; counter2 <= prime2; counter2++){
				if(prime2 % counter2 == 0){
					times2++;
				}
			}
		
			if((times1 == 1) && (times2 == 1)){
				save = ((1/prime1) + (1/prime2));
				if(save < x){
						System.out.println("Kraini twin primes: " + prime1 + ", " + prime2);
						System.out.println("Suma: " + save);
						break;
				}
			}	
		}
	}

}
