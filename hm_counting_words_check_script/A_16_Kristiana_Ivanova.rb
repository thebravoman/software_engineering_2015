require 'csv'

open('Readme.txt', 'w') { |f|
	f.puts"Ada Lovelace created the first algorithm. first algorithm. created"
}

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		result= `ruby #{filename} Readme.txt`
		
		solved = 0

		if result.strip.downcase=="algorithm,2\ncreated,2\nfirst,2\nada,1\nlovelace,1\nthe,1"
			solved = 1
		else
			p result.strip
		end
		csv_array << [name[0],name[1],name[2],name[3].split(".").first,solved]
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
