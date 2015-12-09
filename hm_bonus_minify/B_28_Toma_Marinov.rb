file_name = ARGV[0]
date = ARGV[1]
result = []

#parsed_date = Date._parse(date)

File.readlines(file_name).each do |line|
	curr_line_date = line.split().first()

	if curr_line_date == date
		result << line
	end
end

puts result