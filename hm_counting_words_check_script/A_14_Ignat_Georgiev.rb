require 'csv'

open('check.txt', 'w') { |f|
  f.puts"This is a readme file.
This is a new line in the readme file"
}

CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result = `ruby #{filename} check.txt`
		solved = 0
		if result.gsub("\n", "") == "a,2file,2is,2readme,2this,2in,1line,1new,1the,1"
			solved = 1
		end
		csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
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






