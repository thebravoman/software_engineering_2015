require 'csv'

file_name = ARGV[0]
date = ARGV[1]
value = ARGV[2]
res = []
sum = 0

my_csv = CSV.read(file_name)

my_csv.sort! do |element|
	date = element[0],split("/")
	[date[2].to_i,date[1].to_i,date[0].to_i] 
end 

file_name.each do |row|
	if line[1] == date.to_s
	res << line
	sum = sum + line[3].to_i
	end
end

res.each {
	puts element.join(".")
}

puts sum
