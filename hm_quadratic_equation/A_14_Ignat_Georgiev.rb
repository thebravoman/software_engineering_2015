a=ARGV[0].to_i
b=ARGV[1].to_i
c=ARGV[2].to_i
x_1=0
x_2=0
if a != 0
	def d(a,b,c)
		product = b*b - 4*a*c
	end
	temp = d(a,b,c)
	if temp < 0
	end
	if temp==0
		def zero(a,b,x_1)
		x_1=-b/2*a
		print x_1
		end
	end
	if temp>0
		def first(temp,a,b)
			product=-b+Math.sqrt(temp)
			product=product/2*a
		end
		def second(temp,a,b)
			product =-b -Math.sqrt(temp)
			product=product/2*a
		end
		x_1 = first(temp,a,b)
		x_2 = second(temp,a,b)
		if (x_1>x_2)
		print "#{x_1},#{x_2}"
		elsif (x_2>x_1)
			print "{x_2},#{x_1}"
		end
	end
end

