require 'csv'

my_csv = []
folder1 = ARGV[0]
folder2 = ARGV[1]
pattern = /\b([A-Za-z]+?)(\..+)/

Dir.glob(folder1 + '*').each do |file|
	s = pattern.match(file.split("/").last)
	if s
		name = s[0]
		lenght = name.size / 2
		my_csv << [name, lenght]
	end
end

Dir.glob(folder2 + '*').each do |file|
	s = pattern.match(file.split("/").last)
	if s
		name = s[0]
		lenght = name.size / 2
		my_csv << [name, lenght]
	end
end

my_csv.sort! { |a, b| b[1] <=> a[1] }
my_csv.uniq!

CSV.open('result.csv', 'w') do |csv|
	my_csv.each { |line| csv << line }
end

