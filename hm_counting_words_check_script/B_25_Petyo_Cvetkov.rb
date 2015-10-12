require 'csv'


open('file.txt', 'w') { |f|
  f.puts"How to checkout to a specific date in github"
}

CSV.open("result.csv", "w") do |csv_array|
  Dir.glob(ARGV[0]+"*").each do |filename|
		homeworkFileName = filename.split("/").last.split("_")
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
		result= `ruby #{filename} file.txt`
		solved = 0
		if result == "to,2\nHow,1\ncheckout,1\na,1\nspecific,1\ndate,1\nin,1\ngithub,1\n"
			solved = 1
		end

		csv << [homeworkFileName[0],homeworkFileName[1],homeworkFileName[2],homeworkFileName[3].split(".").first,solved]

  end

end


my_csv = CSV.read 'result.csv'
my_csv.sort!{ |a,b| [a[0], a[1].to_i] <=> [b[0], b[1].to_i]}



CSV.open("result.csv","w") do |csv|
	my_csv.each do |row|
		csv << row
	end
end
