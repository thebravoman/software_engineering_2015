require 'csv' 
file = ARGV[0] 
string = ARGV[1] 
output = [] 
csv_input = CSV.read(file) 
value = 0 
csv_input.sort_by! do |first_row| 
	date = first_row[0].split("/") 
	[date[2].to_i, date[1].to_i, date[0].to_i] 
end  
csv_input.each do |line| 
	if( line[1] == string) 
		output.push(line.join(","))
		value += line[3].to_i 
	end 
end 
puts output
puts value
 
 

