file = ARGV[0]
date = ARGV[1]

File.open(file).each do |line|
	if(line.split(",")[0] == date)
		puts line
	end
end

