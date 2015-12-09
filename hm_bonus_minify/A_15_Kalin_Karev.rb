require 'csv'


filename=ARGV[0].to_s 
data_work=ARGV[1].to_s


file_csv=CSV.read(filename)


file_csv.each do |row|
	if row[0]==data_work
		puts row.join(",")
	end
end
