require 'csv'

open('test.txt', 'w') { |f|
  f.puts"The the the animals. are big,gest hello;  holly in. of peter some whales world"
}

CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result = `ruby #{filename} test.txt`
		solved = 0
		if result.gsub("\n", "") == "the,3animals,1are,1biggest,1hello,1holly,1in,1of,1peter,1some,1whales,1world,1"
			solved = 1
		end

		#p result.gsub("\n","")
		csv << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end	
end

my_csv = CSV.read 'result.csv'
my_csv.sort! {|a, b|[a[0], a[1].to_i] <=> [b[0], b[1].to_i]}
CSV.open("result.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end




