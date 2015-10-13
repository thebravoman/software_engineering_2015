require 'csv'

arr = []


CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		if name.size == 4
			last_name = name[3].split(".").first
			first_name = name[2]
			if !arr.include?([first_name,last_name])
				p "#{name[0]},#{name[1]},#{first_name},#{last_name}"
				result= `ruby #{filename} 1 3 2`
		
				solved = 0
				if result.gsub(/\s/, "")=="-2.0,-1.0"
					solved = 1
				end
			
				csv_array << [name[0],name[1],first_name,last_name,solved]
				arr << [first_name,last_name]
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









