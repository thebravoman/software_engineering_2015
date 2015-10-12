require 'csv'

open('RubyTask.txt', 'w') { |f|
	f.puts "I love this sweet dog."
}

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result= `ruby #{filename} Something.txt`
		solved = 0;
		if result == "dog 1\nsweet 1\nthis 1\nlove 1\nI 1"
			solved = 1;
		end
		csv_array << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end
end


my_csv = CSV.read 'result.csv'

my_csv.sort! do |a, b| 
    (a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
end

CSV.open("result.csv", "w") do |csv|
    my_csv.each do |row|
		csv_array << row
	end
end
