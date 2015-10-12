require 'csv'

CSV.open("result.csv","w") do |csv|

	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result= `ruby #{filename} file.txt`
		solved = 0
		if result=="1900s,1\nearly,1\never,1\nin,1\ninvented,1\nquantum,1\nsince,1\nthe,1\ntheory,1\nthey,1\n"
			solved = 1
		end
		csv << [name[0],name[1],name[2],name[3].split(".").first, solved]
	end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a, b| [a[0], a[1].to_i]  <=> [b[0], b[1].to_i]}

CSV.open("result.csv","w") do |csv|
	my_csv.each {|line| csv<< line }
end



