file = File.open(ARGV[0])
string = ARGV[1]
output = []
sum = 0

file.each do |line|
	l = line.split(',')
	if l[1].to_s == string.to_s
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

output.each do |element|
	element = element.split(',')
	sum += element[3].to_f
end

puts output
puts sum.round(2)
