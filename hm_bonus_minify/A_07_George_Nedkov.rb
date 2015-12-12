require 'csv'

f = ARGV[0]
date = ARGV[1]
a = ARGV[2]
result = []
sum = 0

my_csv = CSV.read(f)

	my_csv.sort! do |element|
		date = element[0],split("/")
		[date[2].to_i,date[1].to_i,date[0].to_i] 
end 

	f.each do |row|
		if line[1] == date.to_s
		result << line
		sum = sum + line[3].to_i
	end
end

	result.each {
		puts element.join(".")
}
