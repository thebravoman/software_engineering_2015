require 'csv'

File.new("file.txt", "w")
file = File.open("file.txt", "w") { |f|
	f.write("a friend who helps when one is in trouble is a real friend")
}

CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result= `ruby #{filename} file.txt`
		solved = 0
		if (result=="a,2\nfriend,2\nis,2\nhelps,1\nin,1\none,1\nreal,1\ntrouble,1\nwhen,1\nwho,1\n")
			solved = 1
		end
		csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end	
end

my_csv = CSV.read 'result.csv'
my_csv.sort! do |a, b| 
	(a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
end
CSV.open("result.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end
