require 'csv'

open('text.txt', 'w') { |f|
  f.puts"You are not my friend you are my brother my friend"
}

CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result = `ruby #{filename} text.txt`
		solved = 0
		
		if result.gsub("\n", "") == "my,3\n,you,2\n,are,2\n,friend,2\n,brother,1\n,not,1\n"
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
