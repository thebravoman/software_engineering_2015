#------------------Quadratic Equation By Dimitur Katzarov-------------------#


def quadraticFormula(a, b, c)
  d = nil
  x1 = nil
  x2 = nil
  
  if a == 0
	return
  end
  
  d = (b ** 2) - (4 * a * c)
  
  if d < 0
	return
  elsif d == 0
	printf("%d", -b / (2 * a))
	return
  elsif d > 0
    x1 = (-b + Math.sqrt(d) ) / (2 * a)
    x2 = (-b - Math.sqrt(d) ) / (2 * a)
	
	if(x1 > x2)
		x1,x2 = x2,x1
	end
	
	printf("%d,%d", x1, x2)
	return
  end

end

a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

quadraticFormula(a, b, c)