
require 'csv'
File.open("text.txt", "w") do |file|
	file.write "Long ago in a distant land, I, Aku long long"
end


CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("\\").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result= `ruby #{filename} Long ago in a distant land, I, Aku long long`
		solved = 0
		if result.strip.downcase=="long,3\nago,1\nin,1\na,1\ndistant,1\nland,1\ni,1\naku,1\n"
			solved = 1
		end
		csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end	
end

my_csv = CSV.read 'result.csv'
my_csv.sort! {  |a,b| (a[0] == b[0]) ? (a[1] <=> b[1]) : (a[0] <=> b[0]) }
CSV.open("result.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end

