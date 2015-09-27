a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i


d = b**2 - a*c*4
if d < 0
          puts "No real roots"
elsif d == 0
          x = -b / 2 * a
          puts "X = #{x}"
    else
              x1 = (-b + Math.sqrt(D))/(2*a)
              x2 = (b + Math.sqrt(D))/(2*a)
            puts "X1 = #{x1}"
            puts "X2 = #{x2}"
  end
