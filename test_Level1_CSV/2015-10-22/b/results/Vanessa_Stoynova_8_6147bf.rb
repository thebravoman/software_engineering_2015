require 'csv'

argument1 = ARGV[0]
argument2 = ARGV[1]

pattern = /\b([a-zA-Z]+?)(\..+)/
my_csv = []

Dir.glob(argument1 + '*').each do |file|
	something = pattern.match(file.split('/').last)
	if something
		full_name = something[0]
		length = full_name.size / 2
		my_csv << [full_name, length]
	end
end
Dir.glob(argument2 + '*').each do |file|
	something = pattern.match(file.split('/').last)
	if something
		full_name = something[0]
		length = full_name.size / 2
		my_csv << [full_name, length]
	end
end
my_csv.sort! { |a, b| b[1] <=> a[1] }
my_csv.uniq!

CSV.open('result.csv', 'w') do |csv|
	my_csv.each { |line| csv << line }
end
