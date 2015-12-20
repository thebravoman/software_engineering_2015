def v1 d
	@my_csv.each do |line|
		if line.split(',').first == d
			puts line
	 	end
	end
end
