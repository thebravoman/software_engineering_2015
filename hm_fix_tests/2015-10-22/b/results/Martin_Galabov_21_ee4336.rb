require 'csv'
input1 = ARGV[0]
input2 = ARGV[1]
my_csv = []
Dir.glob(input1 + "*").each do |file|
	file = file.split("/").last
	name = file.split(".").first
	if name.scan(/[0-9]/).size == 7
		my_csv << [file.to_s, file.length.to_i/2]
	end
end
Dir.glob(input2 + "*").each do |filename|
	filename = filename.split("/").last
	name1 = filename.split(".").first
	if name1.scan(/[0-9]/).size == 7
		my_csv << [filename.to_s, filename.length.to_i/2]
	end
end
	my_csv.uniq!
	my_csv.sort! {|a,b| b[0] <=> a[0]}
	CSV.open("result.csv", "w") do |csv|
		my_csv.each do |el| csv << el
		end
	end
