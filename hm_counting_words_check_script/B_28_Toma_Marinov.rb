require 'csv'

File.new("words.txt")
File.open("words.txt", "w") { |file|
	file.puts "and now we all...and then we all"
}

CSV.open("res.csv","w") do |csv|
	Dir.glob(ARGV[0] + "*").each do |file|
		#~ p file
		result = file.split("/").last.split("_")
		#p "#{result[0]}, #{result[1]}, #{result[2]}, #{result[3].split(".").first}"
		res = `ruby #{file} words.txt`

		solved = 0
		if res == "all,2\nand,2\nwe,2\nnow,1\nthen,1\n"
			solved = 1
		end
		csv << [result[0], result[1], result[2], result[3].split('.').first,solved]
	end
end

my_csv = CSV.read 'res.csv'
my_csv.sort! { |a,b| (a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i) : (a[0] <=> b[0]) }
CSV.open("res.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end