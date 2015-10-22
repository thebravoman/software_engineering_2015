require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]
my_csv = []
Dir.glob(folder1 + "*").each do |files|
	name = files.split("/").last.split("_")
	if name.size == 4
		a = name[0].length + name[1].length + name[2].length + name[3].length
		my_csv << [files,a]
	end
end

Dir.glob(folder2 + "*").each do |files|
	name = files.split("/").last.split("_")
	if name.size == 4
		a = name[0].length + name[1].length + name[2].length + name[3].length
		my_csv << [files,a]
	end
end

my_csv.sort!{|a,b|
	(a[4] == b[4]) ? (a[0] <=> b[0]) : (b[0] <=> a[0])
}
my_csv.uniq!

CSV.open('result.csv','w') do |csv|
	my_csv.each{ |element| csv << element}
end
