a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i


d = b**2 - a*c*4
if d < 0
          puts "No real roots"
elsif d == 0
          x = -b / 2 * a
          puts "#{x}"
    else
              x1 = (-b + Math.sqrt(d))/(2*a)
              x2 = (-b - Math.sqrt(d))/(2*a)
     
            if x1 < x2 
            	puts "#{x1},#{x2}"
            else
            		puts "#{x2},#{x1}"
 						end 
  end
