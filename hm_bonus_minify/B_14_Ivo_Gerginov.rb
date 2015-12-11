require 'csv'

file = ARGV[0]
account = ARGV[1]
csv = CSV.read file
csvHash = Hash.new
counter1 = 1
sum = 0
csv.each do |line|
  if line[1] == account
	counter2 = 0
  	tempArr = Array.new
  	sum += line[3].to_i
  	line.each do |e|
  		tempArr[counter2] = e
  		counter2 += 1
  	end
  	csvHash["#{counter1}"] = tempArr
  	counter1 += 1
  end  
end

csvHash.sort_by {|key, value| value[0]}

csvHash.each do |key, value|
  value.each do |e|
  	print "#{e},"
  end
  puts ""
end
p sum