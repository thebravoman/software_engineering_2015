require 'csv'

CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result = `ruby #{filename} "You are not my friend you are my brother my friend"
		solved = 0
		
		if result == "my,3\nare,2\nfriend,2\nyou,2\nbrother,1\nnot,1\n"
			solved = 1
		end

		csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end	
end

my_csv = CSV.read 'result.csv'
my_csv.sort! {|a, b|[a[0], a[1].to_i] <=> [b[0], b[1].to_i]}
CSV.open("result.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end
