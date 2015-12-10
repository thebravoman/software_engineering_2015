file = File.open(ARGV[0])
date = ARGV[1]
 
file.each do |line|
	if line.split(',').first == date
		puts line
 	end
end
