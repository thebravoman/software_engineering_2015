require_relative './A_24_Petar_Petrov/csv_parser.rb'

file = ARGV[0]
if file.split(".").last == "csv"	
	result = CSVParser.new.parse_csv(file)
	if ARGV[1] == "xml"
		puts result
	else
		result.each do |row| 
	 		puts row.join(',')
		end
	end
end
