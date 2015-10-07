require 'csv'

open('file.txt', 'w') { |a|
  a.puts"You cannot climb the ladder of success dressed in the costume of failure."
}

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result= `ruby #{filename} file.txt`
		
		solved = 0
		if result.strip=="of,2\nthe,2\ncannot,1\ncostume,1\ndressed,1\nfailiure,1\nin,1\nladder,1\nsuccess,1\nyou,1\n"
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

