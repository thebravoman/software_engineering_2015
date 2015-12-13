def v2 d, v
	output = []
	@my_csv.each do |line|
		l = line.split(',')
		if l[0] == d 
			v = v.to_i
			if l[3].to_i > v - 10 and l[3].to_i < v + 10
				output << line
			end
		end
	end
	puts output
end
