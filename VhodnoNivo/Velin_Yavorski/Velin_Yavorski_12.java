import java.util.Scanner;
class Velin_Yavorski_12 {

	public static void main(String[] args) {
		double x,y,w,h,broip,brw,brh,constw;
		double wmal[] = new double[10];
		int counter = -1;
		Scanner scan = new Scanner(System.in);
		
		System.out.println("Vavedi duljina na golqmata plocha: ");
		x = scan.nextDouble();
		System.out.println("Vavedi visochina na golqmata plocha: ");
		y = scan.nextDouble();
		while(x <= 0 || y <= 0){
			System.out.println("Bez otricatelni stoinosti !!!");
			System.out.println("-----------------------------------");
			System.out.println("Vavedi duljina na golqmata plocha ->: ");
			x = scan.nextDouble();
			System.out.println("Vavedi visochina na golqmata plocha: ^");
			y = scan.nextDouble();
		}
		
		System.out.println("Vavedi duljina na malkata plocha ->: ");
		w = scan.nextDouble();
		System.out.println("Vavedi visochina na malkata plocha ^: ");
		h = scan.nextDouble();
		while(w <= 0 || h <= 0){
			System.out.println("Bez otricatelni stoinosti !!!");
			System.out.println("-----------------------------------");
			System.out.println("Vavedi duljina na malkata plocha ->: ");
			w = scan.nextDouble();
			System.out.println("Vavedi visochina na malkata plocha ^: ");
			h = scan.nextDouble();
		}
		
		constw = w;
		
		brw = x/w;
		brh = y/h;
		broip = brw * brh;
		System.out.println("Broi malki plochi: " + (int)broip);
		
		while(w <= x && counter < 9){
			counter++;
			wmal[counter] = w;
			w = w + constw;
		}
		System.out.print("Koordinati po duljina: ");
		for(int count = 0; count < 10; count++){
			System.out.print(wmal[count] + ", ");
		}
		
	}

}
