require 'csv'
File.new("file.txt")
File.open("file.txt", 'r+') {|f| f.write("How to checkout to a specific date in github") }
CSV.open("result.csv", "w") do |csv|
	Dir.glob(ARGV[0] + "*").each do |file|
		name = file.split('/').last.split('_')
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result = `ruby #{file} file.txt`
		solved = 0;
		if result == "to,2\na,1\ncheckout,1\ndate,1\ngithub,1\nhow,1\nin,1\nspecific,1\n"
			solved = 1
		end
		csv << [name[0],name[1],name[2],name[3].split(".").first, solved]
	end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| ([a[0], a[1].to_i] <=> [b[0], b[1].to_i])}
CSV.open("result.csv", "w") do |csv|
        my_csv.each {|line| csv << line}
end
