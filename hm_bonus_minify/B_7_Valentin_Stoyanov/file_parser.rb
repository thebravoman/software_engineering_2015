def file_parse input
	file = File.open(input, 'r')
	file.each do |line|
		@my_csv << line
	end
end
