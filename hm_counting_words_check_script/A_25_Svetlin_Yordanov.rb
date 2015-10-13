require 'csv'

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		result = `ruby #{filename} file.txt`
		solved = 0

		if result.strip == "i,3\nam,2\nthink,1\ntrully,1\nwhat,1"
			solved = 1
		end

		csv_array << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end
end

my_csv = CSV.read 'result.csv'


my_csv.sort! do |a, b| 
	(a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i) : (a[0] <=> b[0])
end


CSV.open("result.csv","w") do |csv_array|
	my_csv.each do |row|
		csv_array << row
	end
end