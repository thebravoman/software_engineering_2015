require 'csv'

checked_files = []

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
			name = filename.split("/").last.split("_")
			if name.size == 4
				last_name = name[3].split(".").first
				first_name = name[2]
				number = name[1]
				clazz = name[0]
				if !checked_files.include? [first_name,last_name]
					p "#{clazz},#{number},#{first_name},#{last_name}"
					result= `ruby #{filename} 1 4 2`
					p result
					solved = 0
					if result.gsub(/\s+/, "")=="-3.414213562373095,-0.5857864376269049"
						solved = 1
					end
					csv_array << [clazz,number,first_name,last_name,solved]
					checked_files << [first_name, last_name]
				end
		end
	end
end

my_csv = CSV.read 'result.csv'

my_csv.sort! do |a, b| 
	(a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
end

CSV.open("result.csv","w") do |csv_array|
	my_csv.each do |row|
		csv_array << row
	end
end









