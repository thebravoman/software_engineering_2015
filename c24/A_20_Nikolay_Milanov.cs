using System; 
using System.Collections.Generic; 
namespace ConsoleApplication1 
{ 
	class Deviders 
	{ 
		static void Main() 
		{ 
			var deviders = new List<int>(); 
			var str = Console.ReadLine(); 
			var num = int.Parse(str); 
			for(var i = 2; i < num; i++) 
			{
				if(num % i == 0) 
					deviders.Add(i); 
			} 
			for(var i = 2; i < num; i++) 
			{ 
				var devided = false; 
				foreach (var t in deviders) 
				{ 
					if (i % t == 0) 
					{ 
						devided = true; 
					} 
				} 
				if(!devided) 
					Console.WriteLine(i); 
			} 
		} 
	} 
}
