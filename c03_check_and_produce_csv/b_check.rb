require 'csv'

CSV.open("result.csv", "w") do |csv_array|
  checked_files = []
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		if name.size == 4
			clazz = name[0]
			number = name[1]
			first_name = name[2]
			last_name = name[3].split(".").first
			
			if !checked_files.include?(first_name+last_name)
				p "#{clazz},#{number},#{first_name},#{last_name}"
				result= `ruby #{filename} 1 3 2`
				checked_files << first_name+last_name
				solved = 0
				if result.strip.gsub(/\s+/, "")=="-2.0,-1.0"
					solved = 1
				end
				csv_array << [clazz,number,first_name,last_name,solved]
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
