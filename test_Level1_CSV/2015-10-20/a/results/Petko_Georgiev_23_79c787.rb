require 'csv'

def get_names fullname
	fullname.split("/").last.split("_")
end

def is_valid? names
	if names.size == 3
		if names[1].length == 5
			true
		end
	end
	false
end

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |file|
		#filename = get_filename file
		names = get_names file
		if is_valid? names
			puts "#{names}"
			csv_array << [names[0],names[1]]
		end
	end
end

csv_file = CSV.read("result.csv")
csv_file.sort! do | a , b |
	(a[1] <=> b[1])
end

CSV.open("result.csv","w") do |csv_arr|
	csv_file.each do |row|
		csv_arr << row
	end
end
