using System;
	class Task11
	{
		static void Main()
		{
		Console.Write("x = ")
		string line = Console.ReadLine()
		double x = double.Parse(line);

		double n = 3.0d;
		double result = 4.0d;
		int i = 1;

		while( true ) {
			if (i % 2 == 0) {

				result = result + (4.0d / n);
			}
			else {

				result = result - (4.0d / n);
			}
			if (4.0d / n < x) {

			break;
			}
			n++;
			i++;
		}
		Console.WriteLine(result);
}
}
