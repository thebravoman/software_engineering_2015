require 'CSV'

file_name = ARGV[0]
date_given = ARGV[1]
value = ARGV[2]

array = []
counter = 0
space_of_value_plus_minus_10 = []

a = value.to_i-10
b = value.to_i+10

for i in a..b
	space_of_value_plus_minus_10 << i
end


CSV.foreach("#{file_name}") do |row|
  if ( (row.first == date_given) and (space_of_value_plus_minus_10 == array[3]) )
	array[counter] = row
	counter = counter+1
  end
end

array.sort {|x,y| x <=> y}
array.each { |a| puts "#{a}" }

CSV.open("A_26_result.csv", "w") do |csv|
  array.each{|element|
    csv<<element
  }
end