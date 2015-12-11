require_relative './A_24_Petar_Petrov/csv_parser.rb'

file = ARGV[0]
if file.split(".").last == "csv"	
	result = CSVParser.new.parse_csv(file)
	result.each do |row| 
	 puts row.join(',')
	end
end
