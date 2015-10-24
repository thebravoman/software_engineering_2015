def quadraticFormula(a, b, c)
    d = (b*b) - (4*a*c)
    
    if a == 0
        return ""
    elsif d > 0
	   fRoot1 = ((-b) + Math.sqrt(d)) / (2*a)
       fRoot2 = ((-b) - Math.sqrt(d)) / (2*a)

       if fRoot1 < fRoot2
            return "#{fRoot1},#{fRoot2}"
        else
            return "#{fRoot2},#{fRoot1}"
        end
    elsif d == 0
        fRoot1 = (-b) / (2*a)
        fRoot2 = fRoot1
        return "#{fRoot1}"
    end
end

a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

puts quadraticFormula(a, b, c)