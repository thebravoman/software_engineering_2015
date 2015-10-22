require 'csv'
CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		if name[2].length==10
		csv << [name[2],name[3].split(".").first]
		end
	end	
end

my_csv = CSV.read 'result.csv'

my_csv.sort! do |a, b| 
	(a[1] == b[1]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
end
my_csv.reverse!

CSV.open("result.csv","w") do |csv_array|
	my_csv.each do |row|
		csv_array << row
	end
end
