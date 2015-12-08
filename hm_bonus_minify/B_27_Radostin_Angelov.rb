path = ARGV[0]
input_date = ARGV[1]

result = []

File.open(path, 'r').each do |line|
	date = line.split(',').first
	if date == input_date
		result.push(line)
	end
end

result.sort!
puts result