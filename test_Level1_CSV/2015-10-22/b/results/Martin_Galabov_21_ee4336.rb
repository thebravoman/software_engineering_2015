require 'csv'
input1 = ARGV[0]
input2 = ARGV[1]
my_csv = []
Dir.glob(input1 + "*").each do |file|
	count = 0
	name = file.split("/").last.split("_").split(".").first
	name.each do |a.to_i|
		if a === (0..9) 
			count++
		end
		end
	if count == 7
		my_csv << [file.to_s, file.length.to_i/2]
	end
end
Dir.glob(input2 + "*").each do |filename|
	count = 0
	name1 = filename.split("/").last.split("_").split(".").first
	name1.each do |a.to_i|
		if a === (0..9) 
			count++
		end
		end
	if count == 7
		my_csv << [filename.to_s, filename.length.to_i/2]
	end
end
	my_csv.uniq!
	my_csv.sort! {|a,b| b[0] <=> a[0]}
	CSV.open("result.csv", "w") do |csv|
		my_csv.each |element| csv << element
	end
	end
