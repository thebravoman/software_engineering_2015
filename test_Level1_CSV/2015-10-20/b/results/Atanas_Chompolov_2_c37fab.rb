require 'csv'

CSV.open("result.csv", "w") do |csv_array|
  checked_files = []
	Dir.glob(ARGV[0] + "*").each do |filename|
		name = filename.split("/").last.split("_")
		if name.size == 3
			first_name = name[0]
			last_name = name[1]
			digit = name[2].split(".").first
			
			if !checked_files.include?(first_name + last_name)
				
			end
		end
	end
end

my_csv = CSV.read 'result.csv'

my_csv.sort! do |a, b| 
	(b[0] == a[0]) ? (b[1].to_i <=> a[1].to_i): (b[0] <=> a[0])
end

CSV.open("result.csv", "w") do |csv_array|
	my_csv.each do |row|
		csv_array << row
	end
end

sort_result
