def is_date? input
	/\d{1,2}\/\d{1,2}\/\d*/.match input
end

def is_number? input
  true if Float(input) rescue false
end

def is_xml? input
	/xml/.match input
end

output = []
input_1 = ARGV[0] #path
input_2 = ARGV[1] #argument 2
input_3 = ARGV[2].to_f if ARGV.size > 2 #argument 3
sum_data = 0

File.open(input_1, 'r').each do |row|
	data = row.split(',')
	#input_2 = date
	if is_date?(input_2) && data[0] == input_2
		#input_3 = nil
		if input_3.nil?
			output.push(row)
		#input_3 = value
		elsif is_number?(input_3) && data[3].to_i >=  (input_3.to_i - 10) && data[3].to_i <= (input_3.to_i + 10) 
			output.push(row)
		end
	#input_2 = account
	elsif !is_date?(input_2) && !is_number?(input_2) && !is_xml?(input_2) && data[1] == input_2
		sum_data += data[3].to_i
		output.push(row)
	end
end

output.sort!
puts output
if sum_data != 0
	puts sum_data
end
