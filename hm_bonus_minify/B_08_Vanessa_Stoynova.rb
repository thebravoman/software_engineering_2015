require 'csv'

sum = 0

file_name = ARGV[0]
account = ARGV[1].to_s
array = []

my_csv = CSV.read file_name

my_csv.each do |line|
	if ARGV[2] == nil
		account = ARGV[1].to_s
			 
		if line[1] == account
    			sum += line[3].to_i
    			array.push(line)
  		end
  	elsif ARGV[2] != nil
  		date = ARGV[1]
  		value = ARGV[2]
  		
  		if line[0] == date && !value
  			array.push(line)
  		else if line[0] == date && (value.to_i - 10 <= line[3].to_i && value.to_i + 10 >= line[3].to_i)
  			array.push(line)
  		end
  	end 
  	end
end

array.sort_by! do |date|
	time = date[0].split("/") 
	[time[2].to_i, time[1].to_i, time[0].to_i];
end

array.each do |line|
	puts line.join(",")
end

if ARGV[2] == nil
	puts "The amount value for all the output rows is: #{sum}\n"
end
