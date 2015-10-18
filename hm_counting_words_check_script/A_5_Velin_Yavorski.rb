require 'csv'

File.open("text.txt", 'w') {|f| f.write("Hello I am Darth Velioo. Nice to meet you Darth !")}

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result= `ruby #{filename} "text.txt"`
		
		solved = 0
		if result.gsub("\n", '')=="darth,2am,1hello,1i,1meet,1nice,1to,1velioo,1you,1marks,2"
			solved = 1
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