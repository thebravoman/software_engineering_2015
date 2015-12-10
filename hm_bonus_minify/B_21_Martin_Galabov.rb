file = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i
File.open(file).each do |line|
	if((line.split(",")[0] == date) && (line.split(",")[3].to_i<(value+10) ) && (line.split(",")[3].to_i>(value-10)))
		puts line
	end
end

