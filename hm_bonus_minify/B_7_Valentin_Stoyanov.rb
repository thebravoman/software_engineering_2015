require 'csv'

file = File.open(ARGV[0])
date = ARGV[1]
value = ARGV[2]
output = []

file.each do |line|
	l = line.split
	if l[0] == date
		if value != nil 
			value = value.to_i
			if l[3].to_i > value - 10 and l[3].to_i < value + 10
				output << line
			end
		else
			output << line
		end
	end
end

output.sort_by!{|d| 
	arr = d.split('/')
	m = arr[0].to_i
	d = arr[1].to_i
	y = arr[2].to_i
	
	[y, m, d]
}

puts output
