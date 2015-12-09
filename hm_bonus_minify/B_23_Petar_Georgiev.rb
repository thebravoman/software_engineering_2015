output = []
File.open(ARGV[0], 'r').each do |data|
	time = data.split(',').first
	if time == ARGV[1]
		output.push(data)
	end	
end
output.sort!
puts output
