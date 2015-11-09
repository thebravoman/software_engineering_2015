require 'csv'

dir_1 = ARGV[0]
dir_2 = ARGV[1]

file_names = []

CSV.open("result.csv","w") do |csv_array|
	Dir.glob(dir_1+"*").each do |path_1|
	 name = path_1.split("/").last
	 splited = name.split("_")
	 if splited.size != 3
		 if !file_names.include?(name)
	 		
	 		name_length = name.length
	 		csv_array << [name,name_length]
	 		file_names << name
	 	end
	end
	end
	
	Dir.glob(dir_2+"*").each do |path_2|
		name = path_2.split("/").last
		splited = name.split("_")
	 	if splited.size != 3
		 if !file_names.include?(name)
	 		
	 		name_length = name.length
	 		csv_array << [name,name_length]
	 		file_names << name
	 	end
	end
	end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b|
	if a[1].to_i == b[1].to_i
		a[0] <=> b[0]
	else
		a[1].to_i <=> b[1].to_i
	end
}

CSV.open("result.csv","w") do |csv_row|
	my_csv.each do |my_row|
		csv_row << my_row
	end
end
