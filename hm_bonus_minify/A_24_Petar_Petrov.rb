require_relative './A_24_Petar_Petrov/monefy.rb'

def is_url?(str)
	str.split("/").first == "http:" || str.split("/").first == "https:"
end
		
def is_number?(str)
	!str.match(/[^0-9]/)
end

file = ARGV[0]
if is_url?(file)
	result = Monefy.parse_website(file)
else
	result = Monefy.parse_file(file)
end
	if ARGV[1] == "xml" || is_number?(ARGV[1])
		puts result
	else
		result.each do |row| 
	 		puts row.join(',')
		end
	end

