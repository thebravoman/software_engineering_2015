import java.util.Scanner;
class Velin_Yavorski_05 {

	public static void main(String[] args) {
		Scanner velioo = new Scanner(System.in);
		double array[] = new double[10];
		int x;
		double k,save,i;
	
		//	System.out.println("Vavedete chislo mejdu 0 i 10");
		//	x = velioo.nextInt();
		
		//	while(x >= 10 || x <= 0){
		//	System.out.println("Vavedete chislo mejdu 0 i 10");
		//	x = velioo.nextInt();
		//}

		for(int counter = 0; counter < 10; counter++){
			k = Math.toRadians(counter);
			array[counter] = Math.cos(k);
			System.out.println(array[counter]);
		}
		
		System.out.println("---------------------------------");
		
		for(int counter = 0; counter < 10; counter++)
			for(int counter2 = counter; counter2 < 10; counter2++){
				if(array[counter] < array[counter2]){
					save = array[counter];
					array[counter] = array[counter2];
					array[counter2] = save;
				}
			}
		
		for(int counter = 0; counter < 10; counter++){
			System.out.println(array[counter]);
		}
		
	}

}
