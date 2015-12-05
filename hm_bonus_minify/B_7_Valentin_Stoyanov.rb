require 'csv'

file = File.open(ARGV[0])
date = ARGV[1]
output = []

file.each do |line|
	if line.split.first == date
		output << line
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

