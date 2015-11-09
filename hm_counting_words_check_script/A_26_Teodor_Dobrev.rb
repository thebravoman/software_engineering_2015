require 'csv'

File.open("txt.txt", 'w') {|f| f.write("Baba Qga v gorata vidqh Baba Qga !")}

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result= `ruby #{filename} "txt.txt"`
		
		solved = 0
		if result.gsub("\n", '')=="Baba => 2Qga => 2v = 2gorata => 1v => 1vidqh"
			solved = 1
		end
		csv_array << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! {|a, b|[a[0], a[1].to_i] <=> [b[0], b[1].to_i]}
CSV.open("result.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end
