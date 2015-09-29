a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
if(a == 0)
	print 'This is not a quadric equation'
else 
	if(b==0 || c == 0)
		print 'This is incomplete quadric equation'
	else 
		D = (b*b) - (4*a*c)
		D.to_i
		if(D > 0)
			x1 = ((-b) + Math.sqrt(D))/2*a
			x1.to_f
			x2 = ((-b) - Math.sqrt(D))/2*a
			x2.to_f
			print 'x1 = ',x1
			puts ''
			print 'x2 = ',x2
		else
			if(D == 0)
				x = (-b)/2*a
				x.to_f
				print 'x = ',x
			else
				print 'No roots!'
			end

		end
	end
end
puts ''
